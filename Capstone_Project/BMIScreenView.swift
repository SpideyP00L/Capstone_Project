//
//  BMIScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-01-31.
//

import SwiftUI

struct BMIScreenView: View {
    @State private var isAnimated = false
    @State private var heightValue: Double = 0
    @State private var weightValue: Double = 0
    @State private var ageValue: Double = 0
    @ObservedObject var sharedData: SharedData = SharedData()

    
    var body: some View {
        ScrollView {
            VStack {
                // Title Text
                Text("BMI Details")
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
                
                // Height Container
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    // Height Text
                    Text("Height")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For Height Slider Value and cm Text
                    HStack {
                        Text("\(Int(heightValue))") // Height Slider Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("cm") // cm Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    
                    // Slider for Height
                    Slider(value: $heightValue, in: 0...250, step: 1)
                        .padding(.horizontal, 20)
                        .accentColor(Color(hex: "C62FF8"))
                        .onChange(of: heightValue) { newValue in
                                sharedData.heightValue = newValue
                            }
                    
                    Spacer()
                }
                
                // Custom Styling for Height Container
                .frame(maxWidth: 300, maxHeight: 150)
                .padding()
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
                        )
                        .opacity(isAnimated ? 1.0 : 0.0)
                        .transition(.opacity)
                        .animation(Animation.easeInOut(duration: 0.8).delay(1), value: isAnimated)
                )
                
                // Weight Container
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    // Weight Text
                    Text("Weight")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For Weight Slider Value and kg Text
                    HStack {
                        Text("\(Int(weightValue))") // Weight Slider Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("Kg") // kg Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    
                    // Slider For Weight
                    Slider(value: $weightValue, in: 0...200, step: 1)
                        .padding(.horizontal, 20)
                        .accentColor(Color(hex: "C62FF8"))
                        .onChange(of: weightValue) { newValue in
                                sharedData.weightValue = newValue
                            }
                    
                    Spacer()
                }
                
                // Custom Styling For Weight Container
                .frame(maxWidth: 300, maxHeight: 150)
                .padding()
                .padding(.top, 20)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(1.5), value: isAnimated)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white, lineWidth: 5)
                                .shadow(radius: 7)
                                .padding(.top, 20)
                        )
                        .opacity(isAnimated ? 1.0 : 0.0)
                        .transition(.opacity)
                        .animation(Animation.easeInOut(duration: 0.8).delay(1.5), value: isAnimated)
                )
                
                // Age Container
                VStack(spacing: 10) {
                    
                    Spacer()
                    // Age Text
                    Text("Age")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For Age Slider Value and kg Text
                    HStack {
                        Text("\(Int(ageValue))") // Age Text
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("yrs") // years Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    
                    // Slider For Age
                    Slider(value: $ageValue, in: 0...100, step: 1)
                        .padding(.horizontal, 20)
                        .accentColor(Color(hex: "C62FF8"))
                        .onChange(of: ageValue) { newValue in
                                sharedData.ageValue = newValue
                            }
                    
                    Spacer()
                }
                
                // Custom Styling for Age Container
                .frame(maxWidth: 300, maxHeight: 150)
                .padding()
                .padding(.top, 20)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(2), value: isAnimated)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white, lineWidth: 5)
                                .shadow(radius: 7)
                                .padding(.top, 20)
                        )
                        .opacity(isAnimated ? 1.0 : 0.0)
                        .transition(.opacity)
                        .animation(Animation.easeInOut(duration: 0.8).delay(2), value: isAnimated)
                )
                
                // NavigationLink to HomeScreenView
                NavigationLink(destination: TabScreenBar(sharedData: sharedData).navigationBarHidden(true)) {
                    Text("Calculate")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                        .padding()
                        .background(Color(hex: "00008B"))
                        .cornerRadius(50)
                        .padding(.top, 20)
                        .scaleEffect(isAnimated ? 1.0 : 0.0)
                        .opacity(isAnimated ? 1.0 : 0.0)
                        .animation(Animation.easeInOut(duration: 0.8).delay(2.5), value: isAnimated)
                }
                
                .padding()
            }

        }
        
        // Custom Styling For the whole screen
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "00FFFF"))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct BMIScreenView_Previews: PreviewProvider {
    static var previews: some View {
        BMIScreenView()
    }
}
