//
//  AppleHealthDetailsView.swift
//  DigiMeSDKExample
//
//  Created on 22/06/2022.
//  Copyright © 2022 digi.me Limited. All rights reserved.
//

import DigiMeSDK
import SwiftUI

struct AppleHealthDetailsView: View {
	var data: [FitnessActivity]
		
	init(_ fitnessData: [FitnessActivity]) {
		data = fitnessData
	}
	
	var body: some View {
		
		List(data) { activity in
			VStack(alignment: .leading, spacing: 8) {
				Text("Start: \(activity.startDate.description(with: .current))").font(.system(size: 14, weight: .medium))
				Text("End: \(activity.endDate.description(with: .current))").font(.system(size: 14, weight: .medium))
				Text("Steps: \(floor(activity.steps))").font(.system(size: 10))
				Text("Distance: \(floor(activity.distance)) \(Locale.current.usesMetricSystem ? "meters" : "miles")").font(.system(size: 10))
				Text("Active energy burned: \(floor(activity.activeEnergyBurned)) kcal").font(.system(size: 10))
			}
		}
	}
}

struct AppleHealthDetailsView_Previews: PreviewProvider {
    static var previews: some View {
		AppleHealthDetailsView([FitnessActivity]())
    }
}
