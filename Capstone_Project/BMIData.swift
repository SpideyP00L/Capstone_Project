//
//  BMIData.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-02-03.
//

import SwiftUI

class BMIData: ObservableObject {
    @Published var bmiValue: Double?
    @Published var bmiCategory: String?

    func calculateBmiCategory() {
        if let bmi = bmiValue {
            if bmi < 18.5 {
                bmiCategory = "Underweight"
            } else if bmi < 24.9 {
                bmiCategory = "Normal"
            } else if bmi < 29.9 {
                bmiCategory = "Overweight"
            } else {
                bmiCategory = "Obese"
            }
        }
    }
}
