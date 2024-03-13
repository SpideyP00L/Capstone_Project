//
//  SetGoalScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-04.
//

import SwiftUI

struct SetGoalScreenView: View {
    @State private var isAnimated = false
    
    @ObservedObject var sharedData: SharedData
    
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
    
    var body: some View {
        ScrollView {
            VStack {
                // Title Text
                Text("Set Goal")
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
                    .animation(Animation.easeInOut(duration: 0.8).delay(0.5))
                
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
                .animation(Animation.easeInOut(duration: 0.8).delay(1.5))
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(1.5))
                )

                
                
            }
            .onAppear {
                let bmiValue = calculateBMI()
                bmiData.bmiValue = bmiValue
                bmiData.calculateBmiCategory()
            }
        }
    }
}

#Preview {
    SetGoalScreenView(sharedData: SharedData())
}
