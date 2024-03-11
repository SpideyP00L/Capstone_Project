//
//  HealthConditionTipsView.swift
//  Capstone_Project
//
//  Created by Emeka Ekeke on 2024-03-06.
//

import SwiftUI

import SwiftUI

struct HealthConditionTipsView: View {
    @State private var isAnimated = false
    @ObservedObject var sharedData: SharedData
    
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
                
                // Display tips based on user's information
                Group {
                    if sharedData.bloodPressureValue > 140 {
                        HeartConditionTipView(title: "Control Blood Pressure", description: "Try to maintain your blood pressure under 140/90 mmHg to reduce the risk of heart diseases. Keep track of your blood pressure, maintain a healthy lifestyle with a balanced diet, regular exercise, and weight management. Avoid smoking and excessive alcohol, manage stress, take prescribed medications, and regularly visit your healthcare provider for check-ups and adjustments.")
                            .padding(.bottom, 10)
                    } else if sharedData.bloodPressureValue < 90 {
                        HeartConditionTipView(title: "Increase Blood Pressure", description: "Low blood pressure can cause dizziness or fainting. Stay hydrated and consider increasing salt intake slightly after consulting with your doctor. For low blood pressure below 90, focus on staying hydrated, increasing salt intake if advised, avoiding alcohol, being cautious with posture changes, considering compression stockings, eating smaller, frequent meals, and consulting a healthcare professional for personalized advice.")
                            .padding(.bottom, 10)
                    } else {
                        Text("Your blood pressure is within the healthy range. Keep up the good work")
                            .font(.custom("Rockwell", size: 12))
                            .foregroundColor(.green)
                            .padding(.bottom, 10)
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
                    
                    if sharedData.heartRateValue > 100 {
                        HeartConditionTipView(title: "High Heart Rate", description: "Engage in aerobic exercises like walking, jogging, or swimming to improve heart health and lower your heart rate. For a heart rate above 100, focus on a balanced diet rich in fruits, vegetables, whole grains, lean proteins (such as poultry, fish, beans, and tofu), healthy fats (like avocados, nuts, and olive oil), and omega-3 fatty acids from sources like fatty fish. Hydration is crucial, so drink plenty of water. Minimize processed foods, control salt intake, and consider consulting a dietitian for personalized recommendations.")
                            
                    } else if sharedData.heartRateValue < 60 {
                        HeartConditionTipView(title: "Low Heart Rate", description: "Low heart rate can indicate bradycardia. For a heart rate below 60, known as bradycardia, ensure regular monitoring of your heart rate. Stay hydrated with ample water intake, and consult with a healthcare professional about potentially increasing salt intake if safe. Avoid stimulants like caffeine and alcohol, and maintain stable blood sugar levels by eating regular, balanced meals. Include iron-rich foods such as lean meats, beans, lentils, and spinach. Incorporate healthy fats from sources like avocados, nuts, seeds, and olive oil into your diet. If experiencing symptoms or if the heart rate remains consistently low, seek guidance from a healthcare provider for personalized advice.")
                    } else {
                        Text("Your heart rate is within the healthy range.")
                            .font(.custom("Rockwell", size: 12))
                            .foregroundColor(.green)
                            .padding(.bottom, 10)
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
                    
                    if sharedData.cholestrolLevelValue > 200 {
                        HeartConditionTipView(title: "High Cholestrol", description: "Follow a low-fat, low-cholesterol diet rich in fruits, vegetables, and whole grains to manage cholesterol levels.Monitor cholesterol levels regularly, focus on a diet rich in fruits, vegetables, whole grains, lean proteins, and healthy fats, while limiting saturated and trans fats. Increase intake of soluble fiber, choose low-fat dairy, limit cholesterol-rich foods, exercise regularly, maintain a healthy weight, avoid smoking, limit alcohol, and consult a healthcare provider for personalized guidance.")
                    } else if sharedData.cholestrolLevelValue < 100 {
                        HeartConditionTipView(title: "Low Cholestrol Level", description: "Low cholesterol levels may indicate malnutrition or underlying health conditions. Monitor regularly, maintain a balanced diet with fruits, vegetables, whole grains, lean proteins, and healthy fats, exercise regularly, avoid smoking, limit alcohol, and consult with a healthcare provider for personalized guidance. Consult with your doctor for appropriate management if it persists.")
                    } else {
                        Text("Your cholesterol level is within the healthy range.")
                            .font(.custom("Rockwell", size: 12))
                            .foregroundColor(.green)
                            .padding(.bottom, 10)
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
                    
                    if sharedData.bloodSugarLevelValue > 140 {
                        HeartConditionTipView(title: "High Blood Sugar", description: "Keep track of your blood sugar levels regularly. For managing blood sugar levels above 140, focus on incorporating non-starchy vegetables, whole grains, lean proteins, healthy fats, berries, citrus fruits, nuts, seeds, legumes, and cinnamon into your diet. Stay hydrated with water. Avoid sugary foods and refined carbohydrates. Consult your doctor for appropriate management strategies.")
                    } else if sharedData.bloodSugarLevelValue < 70 {
                        HeartConditionTipView(title: "Low Blood Sugar", description: "Low blood sugar levels can lead to hypoglycemia. Consume a snack or glucose tablets to raise your blood sugar levels. For managing blood sugar levels below 70, consider incorporating Greek yogurt, cottage cheese, hummus, edamame, avocado, tofu, seeds, non-starchy vegetables, berries, and green leafy vegetables into your diet. These foods provide protein, healthy fats, and fiber, helping to stabilize blood sugar levels. Discuss with your doctor for long-term management.")
                    } else {
                        Text("Your blood sugar level is within the healthy range.")
                            .font(.custom("Rockwell", size: 12))
                            .foregroundColor(.green)
                            .padding(.bottom, 10)
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
                .padding()

            }
        }
        .navigationBarTitle("Heart Condition Tips")
    }
}

struct HeartConditionTipView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
                .font(.custom("Rockwell", size: 30))
            Text(description)
                .font(.custom("Rockwell", size: 12))
                .foregroundColor(.red)
                .padding(.bottom, 10)
                .frame(maxWidth: 300, maxHeight: 500)
                .padding()
                .padding(.top, 20)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white, lineWidth: 5)
                                .shadow(radius: 7)
                        )
                )
            
            
        }
    }
}


