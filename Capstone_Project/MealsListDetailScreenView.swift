//
//  MealsListDetailScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-23.
//

import SwiftUI

struct MealsListDetailScreenView: View {
    var meallist: Meal
    
    var body: some View {
        ScrollView {
            VStack {
                meallist.image
                    .resizable()
                    .frame(width: 250, height: 250)
                    .scaledToFill()
                    .padding(.top, 100)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 2)
                    }
                    .shadow(radius: 10)
                
                Text(meallist.meal_name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text(meallist.countryName)
                    .font(.headline)
                    .padding(.top, 10)
                
                Text("Category: \(meallist.category.uppercased())")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 5)
                    .bold()
                
                Text("Rating: \(meallist.rating)")
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

struct MealsListDetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MealsListDetailScreenView(meallist: meals[0])
    }
}
