//
//  MealsListDetailScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-23.
//

import SwiftUI

struct MealsListDetailScreenView: View {
    var meallist: Meal
    @Environment(ModelData.self) var modelData
    
    var mealIndex: Int {
            modelData.meals.firstIndex(where: { $0.id == meallist.id })!
        }
    
    func mealCategoryColor(for category: String) -> Color {
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
        @Bindable var modelData = modelData
        ScrollView {
            VStack {
                
                meallist.image
                    .resizable()
                    .frame(width: 250, height: 250)
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4.5)
                    }
                    .shadow(radius: 10)
                
                HStack {
                    Text(meallist.meal_name)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    FavoriteButton(isSet: $modelData.meals[mealIndex].favorite)
                        .padding(.top, 20)
                }
                
                HStack {
                    Text("Country :")
                    
                    Text(meallist.countryName)
                    
                }
                .padding(.top, 10)
                .font(.title3)
                .bold()
                
                Text("Category: \(meallist.category.uppercased())")
                    .font(.headline)
                    .foregroundColor(mealCategoryColor(for: meallist.category))
                    .padding(.top, 5)
                
                Text("Rating: \(String(format: "%.2f", meallist.rating))")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding(.top, 5)
                
                Text("\(Text("Description:").bold()) \(meallist.description)")
                    .font(.subheadline)
                    .padding(.top, 20)
                
                Text("\(Text("Nutrients:").bold()) \n Protien: \(meallist.protein), Carbohydrates: \(meallist.carbohydrates), Fat: \(meallist.fat), Fiber: \(meallist.fiber), Calcium: \(meallist.calcium), Iron: \(meallist.iron)")
                    .font(.subheadline)
                    .padding(.top, 20)
                
                Text("\(Text("Cooking Items:").bold()) \(meallist.cooking_items)")
                    .font(.subheadline)
                    .padding(.top, 20)
                
                Text("\(Text("Duration:").bold()) \(meallist.duration)")
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text("\(Text("How To Cook:").bold()) \(meallist.how_to_cook)")
                    .font(.subheadline)
                    .padding(.top, 5)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    let modelData = ModelData()
    return MealsListDetailScreenView(meallist: modelData.meals[0])
        .environment(modelData)
}
