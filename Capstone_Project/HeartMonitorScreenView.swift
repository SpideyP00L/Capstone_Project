//
//  HeartMonitorScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-03.
//

import SwiftUI

struct HeartMonitorScreenView: View {
    @State private var isAnimated = false
    @State private var bloodPressureValue: Double = 0
    @State private var heartRateValue: Double = 0
    @State private var cholestrolLevelValue: Double = 0
    @State private var bloodSugarLevelValue: Double = 0
    @ObservedObject var sharedData: SharedData = SharedData()
    
    var body: some View {
        ScrollView {
            VStack {
                // Title Text
                Text("Heart Monitor")
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
                
                // Blood Pressure Input Container
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    // Blood Pressure Text
                    Text("Blood Pressure")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For Blood Pressure Slider Value and mm/Hg Text
                    HStack {
                        Text("\(Int(bloodPressureValue))") // Blood Pressure Slider Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mm/Hg") // mm/Hg Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    
                    // Slider for Blood Pressure
                    Slider(value: $bloodPressureValue, in: 80...160, step: 1)
                        .padding(.horizontal, 20)
                        .accentColor(Color(hex: "C62FF8"))
                        .onChange(of: bloodPressureValue) { newValue in
                                sharedData.bloodPressureValue = newValue
                            }
                    
                    Spacer()
                }
                
                // Custom Styling for Blood Pressure Container
                .frame(maxWidth: 300, maxHeight: 150)
                .padding()
                .padding(.top, 20)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(1))
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(1))
                )
                
                // Heart Rate Input Container
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    // Heart Rate Text
                    Text("Heart Rate")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For Heart Rate Slider Value and cm Text
                    HStack {
                        Text("\(Int(heartRateValue))") // Heart Rate Slider Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("BPM") // cm Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    
                    // Slider for Heart Rate
                    Slider(value: $heartRateValue, in: 0...150, step: 1)
                        .padding(.horizontal, 20)
                        .accentColor(Color(hex: "C62FF8"))
                        .onChange(of: heartRateValue) { newValue in
                                sharedData.heartRateValue = newValue
                            }
                    
                    Spacer()
                }
                
                // Custom Styling for Heart Rate Container
                .frame(maxWidth: 300, maxHeight: 150)
                .padding()
                .padding(.top, 20)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(1.5))
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(1.5))
                )
                
                // Cholestrol Level Input Container
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    // Cholestrol Level Text
                    Text("Cholestrol Level")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For Cholestrol Level Slider Value and mg/dL Text
                    HStack {
                        Text("\(Int(cholestrolLevelValue))") // Cholestrol Level Slider Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mg/dL") // mg/dL Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    
                    // Slider for Cholestrol Level
                    Slider(value: $cholestrolLevelValue, in: 160...260, step: 1)
                        .padding(.horizontal, 20)
                        .accentColor(Color(hex: "C62FF8"))
                        .onChange(of: cholestrolLevelValue) { newValue in
                                sharedData.cholestrolLevelValue = newValue
                            }
                    
                    Spacer()
                }
                
                // Custom Styling for Cholestrol Level Container
                .frame(maxWidth: 300, maxHeight: 150)
                .padding()
                .padding(.top, 20)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(2))
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(2))
                )
                
                // Blood Sugar Level Input Container
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    // Blood Sugar Text
                    Text("Blood Sugar Level")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For Blood Sugar Slider Value and mg/dL Text
                    HStack {
                        Text("\(Int(bloodSugarLevelValue))") // Blood Sugar Slider Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mg/dL") // mg/dL Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    
                    // Slider for Blood Pressure
                    Slider(value: $bloodSugarLevelValue, in: 60...220, step: 1)
                        .padding(.horizontal, 20)
                        .accentColor(Color(hex: "C62FF8"))
                        .onChange(of: bloodSugarLevelValue) { newValue in
                                sharedData.bloodSugarLevelValue = newValue
                            }
                    
                    Spacer()
                }
                
                // Custom Styling for Blood Pressure Container
                .frame(maxWidth: 300, maxHeight: 150)
                .padding()
                .padding(.top, 20)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(2.5))
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(2.5))
                )
                
                // NavigationLink to HomeScreenView
                NavigationLink(destination: HeartConditionScreenView(sharedData: sharedData)) {
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(2.5))
                }
                // Custom Styling For the whole screen
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

#Preview {
    HeartMonitorScreenView()
}
