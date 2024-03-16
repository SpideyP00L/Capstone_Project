//
//  HeartConditionScreenView.swift
//  Capstone_Project
//
//  Created by Emeka Ekeke on 2024-03-06.
//

import SwiftUI

struct HeartConditionScreenView: View {
    @State private var isAnimated = false
    @ObservedObject var sharedHeartData: SharedHeartData
    @ObservedObject var sharedData: SharedData
    @ObservedObject var sharedGoalData: SharedGoalData
    @ObservedObject var bmiData = BMIData()
    
    var bloodPressureStatus: String {
            let bloodPressure = sharedHeartData.bloodPressureValue
            if bloodPressure > 140 {
                return "Your blood pressure is high. Please consult your doctor."
            } else if bloodPressure < 90 {
                return "Your blood pressure is low. Please consult your doctor."
            } else {
                return "Your blood pressure is normal."
            }
        }
    var heartRateStatus: String {
            let heartRate = sharedHeartData.heartRateValue
            if heartRate > 100 {
                return "Your heart rate is high. Please consult your doctor."
            } else if heartRate < 60 {
                return "Your heart rate is low. Please consult your doctor."
            } else {
                return "Your heart rate is normal."
            }
        }
    var cholesterolStatus: String {
        let cholesterol = sharedHeartData.cholestrolLevelValue
        if cholesterol > 200 {
            return "Your cholesterol level is high. Please consult your doctor."
        } else if cholesterol < 100 {
            return "Your cholesterol level is low. Please consult your doctor."
        } else {
            return "Your cholesterol level is normal."
        }
    }
    
    var sugarLevelStatus: String {
        let sugarLevel = sharedHeartData.bloodSugarLevelValue
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
                    .animation(Animation.easeInOut(duration: 0.8).delay(0.5), value: isAnimated)
                
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
                        Text("\(Int(sharedHeartData.bloodPressureValue))") // Height Slider Value
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
                VStack(spacing: 10) {
                    Spacer()
                    
                    // Heart Rate Text
                    Text("Heart Rate Value")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For heart Pressure
                    HStack {
                        Text("\(Int(sharedHeartData.heartRateValue))") // Heart Rate Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("BPM") // BPM Text
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
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    // For Cholesterol level
                    Text("Colestetrol Level")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For or Cholesterol level
                    HStack {
                        Text("\(Int(sharedHeartData.cholestrolLevelValue))") // Heart Rate Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mg/dL") // mg/dL Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    Text(cholesterolStatus)
                        .padding()
                    
                    Spacer()
                }
                // Custom Styling for Cholesterol level
                .frame(maxWidth: 300, maxHeight: 500)
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
                
                VStack(spacing: 10) {
                    Spacer()
                    
                    // for Blood Sugar Level
                    Text("Blood Suger Level")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For for Blood Sugar Level
                    HStack {
                        Text("\(Int(sharedHeartData.bloodSugarLevelValue))") // Heart Rate Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mg/dL") // mg/dL Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    Text(sugarLevelStatus)
                        .padding()
                    
                    Spacer()
                }
                // Custom Styling for Blood Sugar Level
                .frame(maxWidth: 300, maxHeight: 500)
                .padding()
                .padding(.top, 20)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(2.5), value: isAnimated)
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(2.5), value: isAnimated)
                )

                NavigationLink(destination: HeartConditionTipsView(sharedHeartData: sharedHeartData, sharedData: sharedData, sharedGoalData: sharedGoalData)) {
                    Text("Heart Condition Tips")
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(3), value: isAnimated)
                }
                .padding(.top, 20)

                
                }
        }
    }
}

#Preview {
    HeartConditionScreenView(sharedHeartData: SharedHeartData(), sharedData: SharedData(), sharedGoalData: SharedGoalData())
}
