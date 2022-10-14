//
//  HealthDataOperation.swift
//  DigiMeSDK
//
//  Created on 31/03/2022.
//  Copyright © 2022 digi.me Limited. All rights reserved.
//

import HealthKit
import Foundation

public struct HealthDataOperationResult: Codable {
    public var account: SourceAccount
    public var data: [String: [FitnessActivitySummary]]
}

class HealthDataQuantityOperation: RetryingOperation {
    var operationCompletion: ((Result<HealthDataOperationResult, SDKError>) -> Void)?
    
    private let startDate: Date
    private let endDate: Date
    private let dataTypeIdentifier: String
    private let account: SourceAccount
    
    init(from startDate: Date, to endDate: Date, with dataTypeIdentifier: String, account: SourceAccount) {
        self.startDate = startDate
        self.endDate = endDate
        self.dataTypeIdentifier = dataTypeIdentifier
        self.account = account
        
        super.init()
    }
    
    override func main() {
        guard !isCancelled else {
            finish()
            return
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate)
        let dateInterval = DateComponents(day: 1)
        
        let statisticsOptions = getStatisticsOptions(for: dataTypeIdentifier)
        let initialResultsHandler: (Result<HKStatisticsCollection, SDKError>) -> Void = { [self] result in

            switch result {
            case .success(let statisticsCollection):
                
                var values: [FitnessActivitySummary] = []
                statisticsCollection.enumerateStatistics(from: self.startDate, to: self.endDate) { [self] statistics, obj in
                    
                    var steps = 0.0
                    var distance = 0.0
					var activeEnergyBurned = 0.0
                    var appleExerciseTime = 0
                    
					if
						let unit = HKUnit.preferredUnit(for: dataTypeIdentifier),
						let statisticsQuantity = getStatisticsQuantity(for: statistics, with: statisticsOptions) {
                        
						let value = statisticsQuantity.doubleValue(for: unit)
						switch HKQuantityTypeIdentifier(rawValue: dataTypeIdentifier) {
						case .stepCount:
							steps = value
						case .distanceWalkingRunning:
							distance = (value / 1_000)
						case .activeEnergyBurned:
							activeEnergyBurned = value
                        case .appleExerciseTime:
                            appleExerciseTime = Int(value)
                        default:
                            break
                        }
                    }
                    
                    guard statistics.endDate <= endDate else {
                        return
                    }

                    let distances = FitnessActivitySummary.Distances(activity: "total", distance: distance)
                    let activity = FitnessActivitySummary(startDate: statistics.startDate, endDate: statistics.endDate, steps: steps, distances: [distances], calories: activeEnergyBurned, activity: appleExerciseTime, account: self.account)
                    values.append(activity)
                }
                
                let sorted = values.sorted { $0.startDate > $1.startDate }
                let result = HealthDataOperationResult(account: account, data: [dataTypeIdentifier: sorted])
                operationCompletion?(.success(result))
                finish()
                
            case .failure(let error):
                operationCompletion?(.failure(error))
                finish()
            }
        }
        
        HealthStore.fetchStatistics(with: HKQuantityTypeIdentifier(rawValue: dataTypeIdentifier),
                                               options: statisticsOptions,
                                               interval: dateInterval,
                                               startDate: startDate,
                                               predicate: predicate,
                                               completion: initialResultsHandler)
    }
    
    override func cancel() {
        operationCompletion = nil
        super.cancel()
    }
    
    func getStatisticsOptions(for dataTypeIdentifier: String) -> HKStatisticsOptions {
        var options: HKStatisticsOptions = .discreteAverage
        let sampleType = HKSampleType.getSampleType(for: dataTypeIdentifier)
    
        if sampleType is HKQuantityType {
            let quantityTypeIdentifier = HKQuantityTypeIdentifier(rawValue: dataTypeIdentifier)
    
            switch quantityTypeIdentifier {
			case .stepCount, .distanceWalkingRunning, .activeEnergyBurned:
                options = .cumulativeSum
            case .appleExerciseTime:
                options = .duration
            default:
                break
            }
        }
    
        return options
    }
    
    /// Return the statistics value in `statistics` based on the desired `statisticsOption`.
    func getStatisticsQuantity(for statistics: HKStatistics, with statisticsOptions: HKStatisticsOptions) -> HKQuantity? {
        var statisticsQuantity: HKQuantity?
    
        switch statisticsOptions {
        case .cumulativeSum:
            statisticsQuantity = statistics.sumQuantity()
        case .discreteAverage:
            statisticsQuantity = statistics.averageQuantity()
        case .duration:
            statisticsQuantity = statistics.duration()
        default:
            break
        }
    
        return statisticsQuantity
    }
}
