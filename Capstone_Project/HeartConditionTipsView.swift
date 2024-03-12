//
//  HeartConditionTipsView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-12.
//

import SwiftUI

struct HeartConditionTipsView: View {
    
    @State private var isAnimated = false
    @ObservedObject var sharedData: SharedData
    
    var bloodPressureTips: (String, Color) {
            let bloodPressure = sharedData.bloodPressureValue
            if bloodPressure > 140 {
                return ("Try to maintain your blood pressure under 140/90 mmHg to reduce the risk of heart diseases. Keep track of your blood pressure, maintain a healthy lifestyle with a balanced diet, regular exercise, and weight management. Avoid smoking and excessive alcohol, manage stress, take prescribed medications, and regularly visit your healthcare provider for check-ups and adjustments.", .red)
            } else if bloodPressure < 90 {
                return ("Low blood pressure can cause dizziness or fainting. Stay hydrated and consider increasing salt intake slightly after consulting with your doctor. For low blood pressure below 90, focus on staying hydrated, increasing salt intake if advised, avoiding alcohol, being cautious with posture changes, considering compression stockings, eating smaller, frequent meals, and consulting a healthcare professional for personalized advice.", .yellow)
            } else {
                return ("Your blood pressure is within the healthy range. Keep up the good work", .green)
            }
        }
    
    var bloodPressureStatus: String {
        let bloodPressure = sharedData.bloodPressureValue
        if bloodPressure > 140 {
            return "High"
        } else if bloodPressure < 90 {
            return "Low"
        } else {
            return "Normal"
        }
    }
    
    var heartRateTips: (String, Color) {
            let heartRate = sharedData.heartRateValue
            if heartRate > 100 {
                return ("Engage in aerobic exercises like walking, jogging, or swimming to improve heart health and lower your heart rate. For a heart rate above 100, focus on a balanced diet rich in fruits, vegetables, whole grains, lean proteins (such as poultry, fish, beans, and tofu), healthy fats (like avocados, nuts, and olive oil), and omega-3 fatty acids from sources like fatty fish. Hydration is crucial, so drink plenty of water. Minimize processed foods, control salt intake, and consider consulting a dietitian for personalized recommendations.", .red)
            } else if heartRate < 60 {
                return ("Low heart rate can indicate bradycardia. For a heart rate below 60, known as bradycardia, ensure regular monitoring of your heart rate. Stay hydrated with ample water intake, and consult with a healthcare professional about potentially increasing salt intake if safe. Avoid stimulants like caffeine and alcohol, and maintain stable blood sugar levels by eating regular, balanced meals. Include iron-rich foods such as lean meats, beans, lentils, and spinach. Incorporate healthy fats from sources like avocados, nuts, seeds, and olive oil into your diet. If experiencing symptoms or if the heart rate remains consistently low, seek guidance from a healthcare provider for personalized advice.", .yellow)
            } else {
                return ("Your heart rate is within the healthy range. Keep up the good work", .green)
            }
        }
    
    var heartRateStatus: String {
        let heartRate = sharedData.heartRateValue
        if heartRate > 100 {
            return "High"
        } else if heartRate < 60 {
            return "Low"
        } else {
            return "Normal"
        }
    }
    
    var cholesterolTips: (String, Color) {
        let cholesterol = sharedData.cholestrolLevelValue
        if cholesterol > 200 {
            return ("Follow a low-fat, low-cholesterol diet rich in fruits, vegetables, and whole grains to manage cholesterol levels.Monitor cholesterol levels regularly, focus on a diet rich in fruits, vegetables, whole grains, lean proteins, and healthy fats, while limiting saturated and trans fats. Increase intake of soluble fiber, choose low-fat dairy, limit cholesterol-rich foods, exercise regularly, maintain a healthy weight, avoid smoking, limit alcohol, and consult a healthcare provider for personalized guidance.", .red)
        } else if cholesterol < 100 {
            return ("Low cholesterol levels may indicate malnutrition or underlying health conditions. Monitor regularly, maintain a balanced diet with fruits, vegetables, whole grains, lean proteins, and healthy fats, exercise regularly, avoid smoking, limit alcohol, and consult with a healthcare provider for personalized guidance. Consult with your doctor for appropriate management if it persists.", .yellow)
        } else {
            return ("Your cholesterol level is within the healthy range. Keep up the good work", .green)
        }
    }
    
    var cholestrolLevelStatus: String {
        let cholestrolLevel = sharedData.cholestrolLevelValue
        if cholestrolLevel > 200 {
            return "High"
        } else if cholestrolLevel < 100 {
            return "Low"
        } else {
            return "Normal"
        }
    }
    
    var sugarLevelTips: (String, Color) {
        let sugarLevel = sharedData.bloodSugarLevelValue
        if sugarLevel > 140 {
            return ("Keep track of your blood sugar levels regularly. For managing blood sugar levels above 140, focus on incorporating non-starchy vegetables, whole grains, lean proteins, healthy fats, berries, citrus fruits, nuts, seeds, legumes, and cinnamon into your diet. Stay hydrated with water. Avoid sugary foods and refined carbohydrates. Consult your doctor for appropriate management strategies.", .red)
        } else if sugarLevel < 70 {
            return ("Low blood sugar levels can lead to hypoglycemia. Consume a snack or glucose tablets to raise your blood sugar levels. For managing blood sugar levels below 70, consider incorporating Greek yogurt, cottage cheese, hummus, edamame, avocado, tofu, seeds, non-starchy vegetables, berries, and green leafy vegetables into your diet. These foods provide protein, healthy fats, and fiber, helping to stabilize blood sugar levels. Discuss with your doctor for long-term management.", .yellow)
        } else {
            return ("Your blood sugar level is within the healthy range. Keep up the good work", .green)
        }
    }
    
    var sugarLevelStatus: String {
        let sugarLevel = sharedData.bloodSugarLevelValue
        if sugarLevel > 140 {
            return "High"
        } else if sugarLevel < 70 {
            return "Low"
        } else {
            return "Normal"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Heart Condition Tips")
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
                
                // Blood Pressure Container
                VStack(spacing: 10) {
                    
                    Spacer()
                    
                    // Blood Pressure Text
                    Text("\(bloodPressureStatus) Blood Pressure Tips")
                        .font(.custom("Rockwell", size: 20))
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
                    
                    Text(bloodPressureTips.0)
                        .padding(.horizontal)
                        .foregroundColor(bloodPressureTips.1)
                    
                    Spacer()
                }
                
                // Custom Styling for Blood Pressure Container
                .frame(maxWidth: 300, maxHeight: .infinity)
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
                
                // Heart Rate Container
                VStack(spacing: 10) {
                    Spacer()
                    
                    // Heart Rate Text
                    Text("\(heartRateStatus) Heart Rate Tips")
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
                        
                        Text("BPM") // BPM Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    Text(heartRateTips.0)
                        .padding(.horizontal)
                        .foregroundColor(heartRateTips.1)
                    
                    Spacer()
                }
                // Custom Styling for Heart Rate Container
                .frame(maxWidth: 300, maxHeight: .infinity)
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
                
                // Cholestrol Level Container
                VStack(spacing: 10) {
                    Spacer()
                    
                    // Cholestrol Level Text
                    Text("\(cholestrolLevelStatus) Cholestrol Tips")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For Cholestrol Level
                    HStack {
                        Text("\(Int(sharedData.cholestrolLevelValue))") // Cholestrol Level Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mg/dL") // mg/dL Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    Text(cholesterolTips.0)
                        .padding(.horizontal)
                        .foregroundColor(cholesterolTips.1)
                    
                    Spacer()
                }
                // Custom Styling for Cholestrol Level Container
                .frame(maxWidth: 300, maxHeight: .infinity)
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
                
                // Blood Sugar Level Container
                VStack(spacing: 10) {
                    Spacer()
                    
                    // Blood Sugar Level Text
                    Text("\(sugarLevelStatus) Blood Sugar Tips")
                        .font(.custom("Rockwell", size: 20))
                        .foregroundColor(.black)
                        .padding(.bottom, 10)
                    
                    // HStack For heart Pressure
                    HStack {
                        Text("\(Int(sharedData.bloodSugarLevelValue))") // Blood Sugar Level Value
                            .font(.custom("Rockwell", size: 30))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "C62FF8"))
                            .animation(.none)
                        
                        Text("mg/dL") // mg/dL Text
                            .font(.custom("Rockwell", size: 20))
                            .foregroundColor(.black)
                            .padding(.leading, 5)
                    }
                    Text(sugarLevelTips.0)
                        .padding(.horizontal)
                        .foregroundColor(sugarLevelTips.1)
                    
                    Spacer()
                }
                // Custom Styling for Heart Rate Container
                .frame(maxWidth: 300, maxHeight: .infinity)
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
                NavigationLink(destination: TabScreenBar(sharedData: sharedData)) {
                    Text("Back To Home")
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(3))
                }
                
            }
        }
    }
}

#Preview {
    HeartConditionTipsView(sharedData: SharedData())
}
