//
//  HomeScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-02-01.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var isAnimated = false
    let heightValue: Double
    let weightValue: Double
    let ageValue: Double
    
    @ObservedObject var bmiData = BMIData()

    // Function to calculate BMI
    private func calculateBMI() -> Double {
        let heightInMeters = heightValue / 100
        return weightValue / (heightInMeters * heightInMeters)
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
                HStack {
                    Spacer()
                    
                    NavigationLink(destination: ProfileScreenView()) {
                        Image("Spiderman")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 2)
                            }
                            .shadow(radius: 10)
                    }
                    
                    Spacer()
                    
                    Text("Welcome, Spidey")
                        .font(.custom("Rockwell", size: 26))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                Rectangle()
                    .frame(height: 4)
                    .foregroundColor(Color.black)
                    .padding(.top, 2.0)
                    .padding(.horizontal, 30)
                
                VStack {
                    HStack {
                        Text("Your BMI:")
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)

                        let bmiValue = bmiData.bmiValue ?? 0
                        let bmiCategory = bmiData.bmiCategory ?? "Unknown"

                        Text(String(format: "%.1f", bmiValue))
                            .font(.custom("Rockwell", size: 30))
                            .foregroundColor(getBMIColor(for: bmiValue))

                        Text(bmiCategory)
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(getBMIColor(for: bmiValue))
                    }
                }
                .frame(maxWidth: 300, maxHeight: 150)
                .padding()
                .padding(.top, 60)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(0.5))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(height: 100)
                        .shadow(color: Color(hex: "adb5bd"), radius: 5, x: 5, y: 5)
                        .padding(.top, 60)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white)
                                .padding(.top, 60)
                        )
                        .opacity(isAnimated ? 1.0 : 0.0)
                        .transition(.opacity)
                        .animation(Animation.easeInOut(duration: 0.8).delay(0.5))
                )
                
                Text("What Does Your BMI Mean ?")
                    .padding(.top, 50.0)
                    .padding(.horizontal)
                    .font(.custom("Rockwell", size: 20))
                    .foregroundColor(Color(hex: "0000FF"))
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1))
                
                
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
        HomeScreenView(heightValue: 0, weightValue: 0, ageValue: 0)
    }
}
