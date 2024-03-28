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
                        .bold()
                    
                    Text(meallist.countryName)
                        .bold()
                    
                    Image(systemName: "globe")
                        .foregroundColor(.blue)
                    
                }
                .padding(.top, 10)
                .font(.title3)
                
                HStack {
                    Text("Category: \(meallist.category.uppercased())")
                        .font(.headline)
                        .foregroundColor(mealCategoryColor(for: meallist.category))
                        .padding(.top, 5)
                    
                    Text("Rating: \(String(format: "%.2f", meallist.rating))")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top, 5)
                }
                
                VStack {
                    HStack {
                        Text("Description : ")
                            .bold()
                        
                        Image(systemName: "book.pages")
                            .foregroundColor(.blue)
                    }
                    .font(.title3)
                    .padding(.top, 20)
                    
                    Text(meallist.description)
                        .font(.subheadline)
                        .padding(.top, 5)
                    
                    HStack {
                        Text("Nutrients : ")
                            .bold()
                        
                        Image(systemName: "dumbbell")
                            .foregroundColor(.blue)
                    }
                    .font(.title3)
                    .padding(.top, 20)
                    
                    HStack {
                                                
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Protein: \(meallist.protein)")
                            
                            Text("Carbohydrates: \(meallist.carbohydrates)")
                            
                            Text("Calcium: \(meallist.calcium)")
                        }
                                                
                        VStack(alignment: .trailing, spacing: 5) {
                            Text("Fiber: \(meallist.fiber)")
                            
                            Text("Fat: \(meallist.fat)")
                            
                            Text("Iron: \(meallist.iron)")
                        }
                                                
                    }
                    .padding(.top, 5)
                    .font(.subheadline)
                    .bold()
                    
                    HStack {
                        Text("Cooking Items : ")
                            .bold()
                            
                        Image(systemName: "fork.knife.circle")
                            .foregroundColor(.blue)
                            .font(.system(size: 22))
                    }
                    .font(.title3)
                    .padding(.top, 20)
                                            
                    Text(meallist.cooking_items)
                        .font(.subheadline)
                        .padding(.top, 5)
                    
                    HStack {
                        Text("Duration : ")
                            .bold()
                        
                        Text(meallist.duration)
                            .bold()
                            
                        Image(systemName: "hourglass.circle")
                            .foregroundColor(.blue)
                            .font(.system(size: 22))
                    }
                    .font(.title3)
                    .padding(.top, 20)
                    
                    HStack {
                        Text("How To Cook : ")
                            .bold()
                            
                        Image(systemName: "frying.pan")
                            .foregroundColor(.blue)
                            .font(.system(size: 22))
                    }
                    .font(.title3)
                    .padding(.top, 20)
                    
                    Text(meallist.how_to_cook)
                        .font(.subheadline)
                        .padding(.top, 5)
                }
                .padding(.top, 20)
                .frame(maxWidth: 260, maxHeight: 900)
                .padding()
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white, lineWidth: 5)
                                .shadow(radius: 7)
                                .padding(.top, 20)
                                .padding(.bottom, -20)
                        )
                )
                
                Spacer()
                    .padding(.vertical, 40)
                
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    let modelData = ModelData()
    return MealsListDetailScreenView(meallist: modelData.meals[0])
        .environment(modelData)
}
