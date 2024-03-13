//
//  SharedGoalData.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-13.
//

import SwiftUI

class SharedGoalData: ObservableObject {
    @Published var selectedGoal: String = "No Goal Selected"
    @Published var selectedNutrient: String = ""
    @Published var selectedNutrientValue: String = ""
}
