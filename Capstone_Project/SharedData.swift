//
//  SharedData.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-04.
//

import SwiftUI

class SharedData: ObservableObject {
    @Published var heightValue: Double = 0
    @Published var weightValue: Double = 0
    @Published var ageValue: Double = 0
    
    // Heart Monitor Screens
    @Published var bloodPressureValue: Double = 0
    @Published var heartRateValue: Double = 0
    @Published var cholestrolLevelValue: Double = 0
    @Published var bloodSugarLevelValue: Double = 0
}
