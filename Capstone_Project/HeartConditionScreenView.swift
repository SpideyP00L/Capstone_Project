//
//  HeartConditionScreenView.swift
//  Capstone_Project
//
//  Created by Emeka Ekeke on 2024-03-06.
//

import SwiftUI

struct HeartConditionScreenView: View {
    @State private var isAnimated = false
    @ObservedObject var sharedData: SharedData
    
    var bloodPressureStatus: String {
            let bloodPressure = sharedData.bloodPressureValue
            if bloodPressure > 140 {
                return "Your blood pressure is high. Please consult your doctor.our blood pressure is high. Please consult your doctor.our blood pressure is high. Please consult your doctor.our blood pressure is high. Please consult your doctor.our blood pressure is high. Please consult your doctor.our blood pressure is high. Please consult your doctor.our blood pressure is high. Please consult your doctor.our blood pressure is high. Please consult your doctor.our blood pressure is high. Please consult your doctor."
            } else if bloodPressure < 90 {
                return "Your blood pressure is low. Please consult your doctor."
            } else {
                return "Your blood pressure is normal."
            }
        }
    var heartRateStatus: String {
            let heartRate = sharedData.heartRateValue
            if heartRate > 100 {
                return "Your heart rate is high. Please consult your doctor."
            } else if heartRate < 60 {
                return "Your heart rate is low. Please consult your doctor."
            } else {
                return "Your heart rate is normal."
            }
        }
    var cholesterolStatus: String {
        let cholesterol = sharedData.cholestrolLevelValue
        if cholesterol > 200 {
            return "Your cholesterol level is high. Please consult your doctor."
        } else if cholesterol < 100 {
            return "Your cholesterol level is low. Please consult your doctor."
        } else {
            return "Your cholesterol level is normal."
        }
    }
    
    var sugarLevelStatus: String {
        let sugarLevel = sharedData.bloodSugarLevelValue
        if sugarLevel > 140 {
            return "Your blood sugar level is high. Please consult your doctor."
        } else if sugarLevel < 70 {
            return "Your blood sugar level is low. Please consult your doctor."
        } else {
            return "Your blood sugar level is normal."
        }
    }

   
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Heart Condition")
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
                
                Text("Shared Data Blood Pressure Value: \(sharedData.bloodPressureValue)")
                Text("Shared Data Heart Rate Value: \(sharedData.heartRateValue)")
                Text("Shared Data Cholestrol Level Value: \(sharedData.cholestrolLevelValue)")
                Text("Shared Data Blood Sugar Level Value: \(sharedData.bloodSugarLevelValue)")
                
                // Blood Pressure Container
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    // Blood Pressure Text
                    Text("Blood Pressure Value")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For Blood Pressure
                    HStack {
                        Text("\(Int(sharedData.bloodPressureValue))") // Height Slider Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mm/Hg") // mm/Hg Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    Text(bloodPressureStatus)
                        .padding()
                    
                    Spacer()
                }
                
                // Custom Styling for Blood Pressure Container
                .frame(maxWidth: 300, maxHeight: 500)
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
                VStack(spacing: 10) {
                    Spacer()
                    
                    // Heart Rate Text
                    Text("Heart Rate Value")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For heart Pressure
                    HStack {
                        Text("\(Int(sharedData.heartRateValue))") // Heart Rate Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mm/Hg") // mm/Hg Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    Text(heartRateStatus)
                        .padding()
                    
                    Spacer()
                }
                // Custom Styling for Heart Rate Container
                .frame(maxWidth: 300, maxHeight: 500)
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
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    // Heart Rate Text
                    Text("Colestetrol Level")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For heart Pressure
                    HStack {
                        Text("\(Int(sharedData.heartRateValue))") // Heart Rate Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mm/Hg") // mm/Hg Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    Text(cholesterolStatus)
                        .padding()
                    
                    Spacer()
                }
                // Custom Styling for Heart Rate Container
                .frame(maxWidth: 300, maxHeight: 500)
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
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    // Heart Rate Text
                    Text("Blood Suger Level")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For heart Pressure
                    HStack {
                        Text("\(Int(sharedData.heartRateValue))") // Heart Rate Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mm/Hg") // mm/Hg Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    Text(sugarLevelStatus)
                        .padding()
                    
                    Spacer()
                }
                // Custom Styling for Heart Rate Container
                .frame(maxWidth: 300, maxHeight: 500)
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

            
                
                }
        }
    }
}

#Preview {
    HeartConditionScreenView(sharedData: SharedData())
}
