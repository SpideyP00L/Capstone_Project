//
//  SharedHeartData.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-16.
//

import SwiftUI

class SharedHeartData: ObservableObject {
    
    // Heart Monitor Screens
    @Published var bloodPressureValue: Double = 0
    @Published var heartRateValue: Double = 0
    @Published var cholestrolLevelValue: Double = 0
    @Published var bloodSugarLevelValue: Double = 0
}
