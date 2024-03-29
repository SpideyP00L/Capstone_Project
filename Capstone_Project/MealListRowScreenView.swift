//
//  MealListRowScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-23.
//

import SwiftUI

struct MealListRowScreenView: View {
    var meallist: Meal
    
    func categoryColor(for category: String) -> Color {
           switch category.lowercased() {
           case "veg":
               return .green
           case "non-veg":
               return .red
           case "vegan":
               return .green
           default:
               return .black
           }
       }
    
    var body: some View {
        HStack {
            meallist.image
                .resizable()
                .clipShape(Circle())
                .scaledToFill()
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
                
                Text(meallist.category.uppercased())
                    .font(.headline)
                    .foregroundColor(categoryColor(for: meallist.category))
                    .multilineTextAlignment(.trailing)
                    
                Text("Rating: \(String(format: "%.2f", meallist.rating))")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.trailing)
            }
            
            Spacer()
            
            if meallist.favorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
            
        }
    }
}

#Preview {
    let meals = ModelData().meals
    return Group {
        MealListRowScreenView(meallist: meals[0])
        MealListRowScreenView(meallist: meals[1])
    }
}
