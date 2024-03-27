//
//  MealListRowScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-23.
//

import SwiftUI

struct MealListRowScreenView: View {
    var meallist: Meal
    
    var body: some View {
        HStack {
            meallist.image
                .resizable()
                .clipShape(Circle())
                .frame(width: 80, height: 80)
                .padding()
                
            Spacer()
            
            VStack() {
                Text(meallist.meal_name)
                    .font(.headline)
                    .multilineTextAlignment(.trailing)
                
                Text(meallist.countryName)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                
                HStack {
                    Text(meallist.category.uppercased())
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    .multilineTextAlignment(.trailing)
                    
                    Text("Rating: \(String(format: "%.2f", meallist.rating))")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.trailing)
                }
                    
            }
        }
    }
}

#Preview {
    Group {
        MealListRowScreenView(meallist: meals[0])
        MealListRowScreenView(meallist: meals[1])
    }
}
