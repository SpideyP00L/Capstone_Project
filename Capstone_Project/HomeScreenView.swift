//
//  HomeScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-02-01.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var isAnimated = false
    @ObservedObject var sharedData: SharedData
    @ObservedObject var sharedGoalData: SharedGoalData
    @ObservedObject var sharedHeartData: SharedHeartData
    @ObservedObject var bmiData = BMIData()

    // Function to calculate BMI
    private func calculateBMI() -> Double {
        let heightInMeters = sharedData.heightValue / 100
        return sharedData.weightValue / (heightInMeters * heightInMeters)
    }

    // Helper function to determine color based on BMI value
    private func getBMIColor(for bmiValue: Double) -> Color {
        switch bmiValue {
        case ..<18.5:
            return .blue
        case 18.5..<25:
            return .green
        case 25..<30:
            return .yellow
        default:
            return .red
        }
    }
    
    private func getColorForSelectedGoal(_ goal: String) -> Color {
        switch goal {
        case "Underweight         ":
            return .blue
        case "Normal              ":
            return .green
        case "Overweight          ":
            return .yellow
        case "Obese               ":
            return .red
        default:
            return .black
        }
    }
    
    private var selectedNutrients: [Nutrient] {
        switch sharedGoalData.selectedGoal {
        case "Underweight         ":
            return [
                Nutrient(name: "Protein", value: "100g"),
                Nutrient(name: "Carbohydrates", value: "150g"),
                Nutrient(name: "Fat", value: "50g"),
                Nutrient(name: "Fiber", value: "25g"),
                Nutrient(name: "Calcium", value: "1000mg"),
                Nutrient(name: "Iron", value: "18mg")
            ]
        case "Normal              ":
            return [
                Nutrient(name: "Protein", value: "120g"),
                Nutrient(name: "Carbohydrates", value: "180g"),
                Nutrient(name: "Fat", value: "60g"),
                Nutrient(name: "Fiber", value: "30g"),
                Nutrient(name: "Calcium", value: "1200mg"),
                Nutrient(name: "Iron", value: "20mg")
            ]
        case "Overweight          ":
            return [
                Nutrient(name: "Protein", value: "110g"),
                Nutrient(name: "Carbohydrates", value: "160g"),
                Nutrient(name: "Fat", value: "55g"),
                Nutrient(name: "Fiber", value: "27g"),
                Nutrient(name: "Calcium", value: "1100mg"),
                Nutrient(name: "Iron", value: "19mg")
            ]
        case "Obese               ":
            return [
                Nutrient(name: "Protein", value: "100g"),
                Nutrient(name: "Carbohydrates", value: "140g"),
                Nutrient(name: "Fat", value: "45g"),
                Nutrient(name: "Fiber", value: "20g"),
                Nutrient(name: "Calcium", value: "900mg"),
                Nutrient(name: "Iron", value: "17mg")
            ]
        default:
            return [
                Nutrient(name: "Protein", value: "-"),
                Nutrient(name: "Carbohydrates", value: "-"),
                Nutrient(name: "Fat", value: "-"),
                Nutrient(name: "Fiber", value: "-"),
                Nutrient(name: "Calcium", value: "-"),
                Nutrient(name: "Iron", value: "-")
            ]
        }
    }


    var body: some View {
        ScrollView {
            VStack {
                HStack { // Hstack for Profile Image and Welcome Message with name
                    Spacer()
                    
                    NavigationLink(destination: ProfileScreenView()) { // Navigation link to Profile Screen
                        Image("Spiderman") // Profile Image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 2)
                            }
                            .shadow(radius: 10)
                            .opacity(isAnimated ? 1.0 : 0.0)
                            .transition(.opacity)
                            .animation(Animation.easeInOut(duration: 0.8).delay(0.5), value: isAnimated)
                    }
                    
                    Spacer()
                    
                    // Welcome Message with Name text
                    Text("Welcome, Spidey")
                        .font(.custom("Rockwell", size: 26))
                        .opacity(isAnimated ? 1.0 : 0.0)
                        .transition(.opacity)
                        .animation(Animation.easeInOut(duration: 0.8).delay(0.5), value: isAnimated)
                    
                    Spacer()
                }
                // Styling for Hstack
                .padding(.horizontal)
                
                // Custom Bar Styling
                Rectangle()
                    .frame(height: 4) // Change for Thickness
                    .foregroundColor(Color.black)
                    .padding(.top, 2.0)
                    .padding(.horizontal, 30)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1), value: isAnimated)
                
                // Vstack For BMI Value and Category and Container Styling
                VStack {
                    HStack { // HStack for texts
                        Text("Your BMI:") // BMI Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)

                        let bmiValue = bmiData.bmiValue ?? 0
                        let bmiCategory = bmiData.bmiCategory ?? "Unknown"

                        Text(String(format: "%.1f", bmiValue)) // BMI Value with .1 decimal
                            .font(.custom("Rockwell", size: 30))
                            .foregroundColor(getBMIColor(for: bmiValue)) // changing the color based on BMI Value

                        Text(bmiCategory) // BMI Weight Category
                            .font(.custom("Rockwell", size: 16))
                            .foregroundColor(getBMIColor(for: bmiValue)) // changing the color based on BMI Value
                    }
                }
                
                // Custom Styling for the BMI Container
                .frame(maxWidth: 300, maxHeight: 150)
                .padding()
                .padding(.top, 60)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(1.5), value: isAnimated)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(height: 100)
                        .shadow(color: Color(hex: "D3D3D3"), radius: 5, x: 5, y: 5)
                        .padding(.top, 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white)
                                .padding(.top, 60)
                        )
                        .opacity(isAnimated ? 1.0 : 0.0)
                        .transition(.opacity)
                        .animation(Animation.easeInOut(duration: 0.8).delay(1.5), value: isAnimated)
                )
                
                // BMI Text 
                Text("What Does Your BMI Mean ?")
                    .padding(.top, 50.0)
                    .padding(.horizontal)
                    .font(.custom("Rockwell", size: 22))
                    .foregroundColor(Color(hex: "0000FF"))
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(2), value: isAnimated)
                
                
                // Vstack For BMI Info and Container Styling
                NavigationLink(destination: BMIInfoScreenView()) {
                    VStack {
                        HStack { // HStack for Underweight texts
                            Text("Less Than 18.5") // BMI value
                                .font(.custom("Rockwell", size: 20))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)

                            Spacer()
                            
                            Text("Underweight") // Underweight Text
                                .font(.custom("Rockwell", size: 20))
                                .foregroundColor(.blue)
                                .multilineTextAlignment(.trailing)
                        }
                        
                        HStack { // HStack for texts
                            Text("18.5 to 24.9") // BMI value
                                .font(.custom("Rockwell", size: 20))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            Text("Normal") // Normal Text
                                .font(.custom("Rockwell", size: 20))
                                .foregroundColor(.green)
                                .multilineTextAlignment(.trailing)
                        }
                        .padding(.top)
                        
                        HStack { // HStack for texts
                            Text("25 to 29.9") // BMI value
                                .font(.custom("Rockwell", size: 20))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            Text("Overweight") // Overweight Text
                                .font(.custom("Rockwell", size: 20))
                                .foregroundColor(.yellow)
                                .multilineTextAlignment(.trailing)
                        }
                        .padding(.top)
                        
                        HStack { // HStack for texts
                            Text("30 or above") // BMI value
                                .font(.custom("Rockwell", size: 20))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            Text("Obese") // Normal Text
                                .font(.custom("Rockwell", size: 20))
                                .foregroundColor(.red)
                                .multilineTextAlignment(.trailing)
                        }
                        .padding(.top)
                        
                        Text("Click For More Info")
                            .font(.custom("Rockwell", size: 20))
                            .padding(.top)
                            .foregroundColor(.gray)
                    }
                    
                    // Custom Styling for the BMI Info Container
                    .frame(maxWidth: 300, maxHeight: 500)
                    .padding()
                    .padding(.top, 60)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(2.5), value: isAnimated)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white)
                            .frame(height: 280)
                            .shadow(color: Color(hex: "D3D3D3"), radius: 5, x: 5, y: 5)
                            .padding(.top, 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.white)
                                    .padding(.top, 60)
                            )
                            .opacity(isAnimated ? 1.0 : 0.0)
                            .transition(.opacity)
                            .animation(Animation.easeInOut(duration: 0.8).delay(2.5), value: isAnimated)
                    )
                }
                
                
                // BMI Text
                Text("Selected Goal To Achieve")
                    .padding(.top, 80.0)
                    .padding(.horizontal)
                    .font(.custom("Rockwell", size: 22))
                    .foregroundColor(Color(hex: "0000FF"))
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(3), value: isAnimated)
                
                // Vstack For Goal Selected and Container Styling
                VStack {
                    VStack { // VStack for texts
                        Text("Goal Selected: \(sharedGoalData.selectedGoal)")
                            .font(.custom("Rockwell", size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(getColorForSelectedGoal(sharedGoalData.selectedGoal))
                            .multilineTextAlignment(.center)
                    }
                    
                    HStack {
                        Text("Nutrient")
                            .font(.custom("Rockwell", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("Value")
                            .font(.custom("Rockwell", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.trailing)
                            .padding(.trailing)
                    }
                    .padding(.top)
                    
                    ForEach(selectedNutrients, id: \.name) { nutrient in
                                HStack {
                                    Text(nutrient.name)
                                        .font(.custom("Rockwell", size: 18))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading)
                                    
                                    Spacer()
                                    
                                    Text(nutrient.value)
                                        .font(.custom("Rockwell", size: 18))
                                        .foregroundColor((getColorForSelectedGoal(sharedGoalData.selectedGoal)))
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.trailing)
                                        .padding(.trailing)
                                }
                                .padding(.top)
                            }
                }
                
                // Custom Styling for the Goal Container
                .padding(.top, 20)
                .frame(maxWidth: 260, maxHeight: 600)
                .padding()
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(3.5), value: isAnimated)
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(3.5), value: isAnimated)
                )
                
                .padding(.bottom, 80)
                
                .onAppear {
                    isAnimated = true
                }
            }
            
            .onAppear {
                let bmiValue = calculateBMI()
                bmiData.bmiValue = bmiValue
                bmiData.calculateBmiCategory()
            }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(sharedData: SharedData(), sharedGoalData: SharedGoalData(), sharedHeartData: SharedHeartData())
    }
}
