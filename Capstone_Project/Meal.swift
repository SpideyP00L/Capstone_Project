//
//  Meal.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-23.
//

import Foundation
import SwiftUI

struct Meal: Hashable, Codable, Identifiable {
    var id: Int
    var countryName: String
    var category: String
    var meal_name: String
    var cooking_items: String
    var duration: String
    var rating: Double
    var how_to_cook: String
    var description: String
    var protein: String
    var carbohydrates: String
    var fat: String
    var fiber: String
    var calcium: String
    var iron: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
