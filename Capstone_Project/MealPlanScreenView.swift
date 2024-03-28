//
//  MealPlanScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-04.
//

import SwiftUI

struct MealPlanScreenView: View {
    @State private var isAnimated = false
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false

    var filteredMeals: [Meal] {
        modelData.meals.filter { mealList in
            (!showFavoritesOnly || mealList.favorite)
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Title Text
                    Text("Meal Plan")
                        .font(.custom("Rockwell", size: 30))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.top, 30)
                        .scaleEffect(isAnimated ? 1 : 0)
                        .onAppear {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                                isAnimated = true
                            }
                        }
                    
                    // Custom Bar Styling
                    Rectangle()
                        .frame(height: 4) // Change for Thickness
                        .foregroundColor(Color.black)
                        .padding(.top, 2.0)
                        .padding(.horizontal, 30)
                        .opacity(isAnimated ? 1.0 : 0.0)
                        .transition(.opacity)
                        .animation(Animation.easeInOut(duration: 0.8).delay(0.5), value: isAnimated)
                    
                    Spacer()
                    
                    VStack {
                        Text("This meal plan is designed to provide \(Text("balanced nutrition for overall health and well-being.").bold().foregroundColor(Color(hex: "007200"))) It aims to include a \(Text("variety of nutrients").bold()) while being flexible enough to accommodate different \(Text("dietary preferences and restrictions.").bold())")
                        
                        Text("\nDaily Structure :")
                            .bold()
                        
                        Text("\n\(Text("Breakfast:").bold()) Start your day with a \(Text("nutritious meal to fuel your body and brain.").bold()) Include a source of \(Text("protein, whole grains, and fruits or vegetables.").bold().foregroundColor(Color(hex: "007200")))")
                        
                        Text("\n\(Text("Lunch:").bold()) Aim for a \(Text("balanced meal").bold()) containing \(Text("lean protein, whole grains, and plenty of vegetables or salads.").bold().foregroundColor(Color(hex: "007200")))")
                        
                        Text("\n\(Text("Dinner:").bold()) Finish your day with a \(Text("satisfying meal").bold()) that includes \(Text("lean protein, whole grains or starchy vegetables, and a variety of colorful vegetables.").bold().foregroundColor(Color(hex: "007200")))")
                        
                        Text("\n\(Text("Hydration:").bold().foregroundColor(.blue)) Throughout the day, prioritize staying \(Text("hydrated by drinking plenty of water.").bold().foregroundColor(.blue)) You can also include \(Text("herbal teas or infused water for variety.").bold().foregroundColor(.blue))")
                    }
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .frame(maxWidth: 260, maxHeight: 900)
                    .padding()
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1), value: isAnimated)
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
                            .opacity(isAnimated ? 1.0 : 0.0)
                            .transition(.opacity)
                            .animation(Animation.easeInOut(duration: 0.8).delay(1), value: isAnimated)
                    )
                    
                    Spacer()
                    
                    // List Navigation
                    NavigationLink {
                        List {
                            Toggle(isOn: $showFavoritesOnly) {
                                Text("Favorite / Featured Meals")
                                    .bold()
                            }
                            
                            ForEach(filteredMeals) { meallist in
                                NavigationLink {
                                    MealsListDetailScreenView(meallist: meallist)
                                } label: {
                                    MealListRowScreenView(meallist: meallist)
                                }
                            }
                        }
                        .animation(.default, value: filteredMeals)
                        .navigationBarTitle("Meal List", displayMode: .large)
                    } label: {
                        Text("Select a Meal")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 50)
                            .background(Color.blue)
                            .cornerRadius(50)
                            .environment(ModelData())
                    }
                    .padding(.top, 70)
                    .padding(.bottom, 40)
                }
            }
        }
    }
}

struct MealPlanScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MealPlanScreenView()
            .environment(ModelData())
    }
}
