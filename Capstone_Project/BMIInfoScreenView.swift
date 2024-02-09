//
//  BMIInfoScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-02-04.
//

import SwiftUI

struct BMIInfoScreenView: View {
    @State private var isAnimated = false
    
    var body: some View {
        ScrollView {
            VStack {
                // Title Text
                Text("BMI Info")
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
                    .padding(.vertical)
                    .padding(.horizontal, 30)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(0.5))
                
                // Custom Image Styling For Consistent Look
                Image("BMI") // Image name
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 250)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1.0))
                
                // BMI Info Text
                Text("Body Mass Index is referred to as BMI. It is a metric used to determine if a person weighs a healthy amount given their height. BMI is determined by taking the square of an individual's height in meters and multiplying it by their weight in kilograms (weight (kg) / height (m)^2).")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1.5))
                
                // BMI Info Text
                Text("Because it can indicate whether a person is underweight, normal weight, overweight, or obese, BMI is significant. Although it isn't a perfect indicator of body fatness or general health, it can be a helpful screening tool to find probable health issues linked to weight.")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(2))
                
                // BMI Underweight Title Text
                Text("Underweight: BMI less than 18.5")
                    .fontWeight(.bold)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(2.5))
                    .padding(.top, 30)
                
                // BMI Underweight Info Text
                Text("Health implications: Increased risk of nutrient deficiencies, weakened immune system, osteoporosis, fertility issues, and other health problems.")
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(2.5))
                    .padding(.top, 10)
                    .padding(.horizontal, 30)
                
                // BMI Normal weight Title Text
                Text("Normal weight: BMI between 18.5 and 24.9")
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(3))
                    .padding(.top, 30)
                
                // BMI Normal weight Info Text
                Text("Health implications: Generally lower risk of weight-related health issues such as heart disease, type 2 diabetes, and certain cancers.")
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(3))
                    .padding(.top, 10)
                    .padding(.horizontal, 30)
                
                // BMI Overweight Title Text
                Text("Overweight: BMI between 25 and 29.9")
                    .fontWeight(.bold)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .foregroundColor(.yellow)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(3.5))
                    .padding(.top, 30)
                
                // BMI Overweight Info Text
                Text("Health implications: Increased risk of heart disease, type 2 diabetes, high blood pressure, stroke, certain cancers, sleep apnea, and other health problems.")
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(3.5))
                    .padding(.top, 10)
                    .padding(.horizontal, 30)
                
                // BMI Obese Title Text
                Text("Obesity: BMI of 30 or higher")
                    .fontWeight(.bold)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .foregroundColor(.red)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(4))
                    .padding(.top, 30)
                
                // BMI Obese Info Text
                Text("Health implications: Significant increase in the risk of heart disease, stroke, type 2 diabetes, high blood pressure, certain cancers (such as breast, colon, and prostate), sleep apnea, osteoarthritis, and other health problems.")
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(4))
                    .padding(.top, 10)
                    .padding(.horizontal, 30)
                
                // BMI General Info Text
                Text("It's crucial to remember that BMI is a generic measure and does not account for elements that can influence health outcomes, such as muscle mass, bone density, or fat distribution. As a result, people with high muscle mass, for instance, might not necessarily be at higher risk for health problems even when they have a high BMI and a low body fat percentage. BMI interpretation should also take into account other risk factors and health markers. For individualized health assessments and guidance, speaking with a healthcare expert is advised.")
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 30)
                    .padding(.horizontal, 30)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(4.5))
            }
        }
    }
}

#Preview {
    BMIInfoScreenView()
}
