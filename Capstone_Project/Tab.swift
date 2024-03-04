//
//  Tab.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-03.
//

import SwiftUI

enum Tab: String, CaseIterable {
    
    case home = "Home"
    case bmi = "BMI"
    case setGoal = "Set Goal"
    case heart = "Heart"
    case meal = "Meals"
    
    var systemImage: String {
        switch self {
            case.home: return "house.fill"
            case.bmi: return "heart.fill"
            case.setGoal: return "figure.walk.circle.fill"
            case.heart: return "bolt.heart.fill"
            case.meal: return "fork.knife.circle.fill"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
