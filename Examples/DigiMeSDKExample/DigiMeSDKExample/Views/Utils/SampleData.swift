//
//  SampleData.swift
//  DigiMeSDKExample
//
//  Created on 03/02/2023.
//  Copyright © 2023 digi.me Limited. All rights reserved.
//

import DigiMeSDK
import SwiftUI

func date(year: Int, month: Int, day: Int = 1) -> Date {
	Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}

enum ScopingTemplates {
	static let date = Date()

	// "Today"
	static let startOfToday = Calendar.current.startOfDay(for: date)
	static let endOfToday = Calendar.current.date(byAdding: .day, value: 1, to: startOfToday)!

	// "Yesterday"
	static let startOfYesterday = Calendar.current.date(byAdding: .day, value: -1, to: startOfToday)!
	static let endOfYesterday = Calendar.current.date(byAdding: .day, value: 1, to: startOfYesterday)!

	// "This Week"
	static let startOfWeek = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: date))!
	static let endOfWeek = Calendar.current.date(byAdding: .day, value: 1, to: startOfWeek.addingTimeInterval(7*24*60*60))!

	// "Last Week"
	static let startOfLastWeek = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: startOfWeek)!
	static let endOfLastWeek = startOfWeek

	// "This Month"
	static let startOfMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: date))!
	static let endOfMonth = date

	// "Last Month"
	static let startOfLastMonth = Calendar.current.date(byAdding: .month, value: -1, to: startOfMonth)!
	static let endOfLastMonth = Calendar.current.date(byAdding: .month, value: 1, to: startOfLastMonth)!

	// "This Year"
	static let startOfYear = Calendar.current.date(from: Calendar.current.dateComponents([.year], from: date))!
	static let endOfYear = date

	// "Last Year"
	static let startOfLastYear = Calendar.current.date(byAdding: .year, value: -1, to: startOfYear)!
	static let endOfLastYear = Calendar.current.date(byAdding: .day, value: -1, to: startOfYear)!
	static let defaultScopes: [ScopeTemplate] = [
		ScopeTemplate(name: "Today", scope: Scope(timeRanges: [TimeRange.between(from: startOfToday, to: endOfToday)])),
		ScopeTemplate(name: "Yesterday", scope: Scope(timeRanges: [TimeRange.between(from: startOfYesterday, to: endOfYesterday)])),
		ScopeTemplate(name: "This Week", scope: Scope(timeRanges: [TimeRange.between(from: startOfWeek, to: endOfWeek)])),
		ScopeTemplate(name: "Last Week", scope: Scope(timeRanges: [TimeRange.between(from: startOfLastWeek, to: endOfLastWeek)])),
		ScopeTemplate(name: "This Month", scope: Scope(timeRanges: [TimeRange.between(from: startOfMonth, to: endOfMonth)])),
		ScopeTemplate(name: "Last Month", scope: Scope(timeRanges: [TimeRange.between(from: startOfLastMonth, to: endOfLastMonth)])),
		ScopeTemplate(name: "This Year", scope: Scope(timeRanges: [TimeRange.between(from: startOfYear, to: endOfYear)])),
		ScopeTemplate(name: "Last Year", scope: Scope(timeRanges: [TimeRange.between(from: startOfLastYear, to: endOfLastYear)])),
		ScopeTemplate(name: "Custom ...", scope: Scope(timeRanges: [])),
	]
}

enum DailyActivityTestData {
	static let last30Days: [FitnessActivitySummary] = [
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 8), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 9), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 10), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 11), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 12), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 13), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 14), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 15), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 16), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 17), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 18), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 19), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 20), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 21), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 22), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 23), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 24), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 25), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 26), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 27), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 28), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 29), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 30), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5, day: 31), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 6, day: 1), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 6, day: 2), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 6, day: 3), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 6, day: 4), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 6, day: 5), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 6, day: 6), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
	]
	
	static var last30DaysTotal: Int {
		last30Days.map { Int($0.steps) }.reduce(0, +)
	}

	static var last30DaysAverage: Double {
		Double(last30DaysTotal / last30Days.count)
	}
	
	static let allTime: [FitnessActivitySummary] = [
		FitnessActivitySummary(startDate: date(year: 2021, month: 7), endDate: date(year: 2021, month: 7), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2021, month: 8), endDate: date(year: 2021, month: 8), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2021, month: 9), endDate: date(year: 2021, month: 9), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2021, month: 10), endDate: date(year: 2021, month: 10), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2021, month: 11), endDate: date(year: 2021, month: 11), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2021, month: 12), endDate: date(year: 2021, month: 12), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 1), endDate: date(year: 2022, month: 1), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 2), endDate: date(year: 2022, month: 2), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 3), endDate: date(year: 2022, month: 3), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 4), endDate: date(year: 2022, month: 4), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 5), endDate: date(year: 2022, month: 5), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
		FitnessActivitySummary(startDate: date(year: 2022, month: 6), endDate: date(year: 2022, month: 6), steps: Double.random(in: 1...999), distances: [FitnessActivitySummary.Distances(activity: "", distance: Double.random(in: 1...999))], calories: Double.random(in: 1...999), activity: Int(Double.random(in: 1...999))),
	]
	
	static var allTimeTotal: Int {
		allTime.map { Int($0.steps) }.reduce(0, +)
	}

	static var allTimeDailyAverage: Int {
		allTime.map { Int($0.steps) }.reduce(0, +) / allTime.count
	}
}
