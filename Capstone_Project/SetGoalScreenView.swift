import SwiftUI

struct Nutrient {
    var name: String
    var value: String
}

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
    
    // Calculate recommended goal based on BMI category
    var recommendedGoal: Text {
        guard let bmiValue = bmiData.bmiValue else {
            return Text("Unknown")
        }

        if bmiValue < 18.5 {
            return Text("\(Text("If you are underweight,").bold().foregroundColor(.red)) it's important to focus on \(Text("gradually gaining weight").bold().foregroundColor(.black)) by increasing \(Text("calorie intake").bold().foregroundColor(.black)) and \(Text("incorporating nutrient-rich foods").bold().foregroundColor(.black)) into your diet.\n\n\(Text("The recommend Goal would Be Normal / Healthly BMI between 19 to 24 for BMI Value").bold().foregroundColor(.green))")
        } else if bmiValue < 24.9 {
            return Text("\(Text("Congratulations on maintaining a healthy weight!").bold().foregroundColor(.green)) Continue prioritizing your health by consuming a \(Text("balanced diet rich in fruits, vegetables, lean proteins, and whole grains.").bold().foregroundColor(.black)) Regular physical activity is also essential for \(Text("overall well-being.").bold().foregroundColor(.black))")
        } else if bmiValue < 29.9 {
            return Text("\(Text("For individuals who are overweight,").bold().foregroundColor(.red)) focusing on \(Text("gradual weight loss").bold().foregroundColor(.black)) through a combination of \(Text("balanced nutrition, portion control, increased physical activity, and healthy lifestyle habits").bold().foregroundColor(.black)) is recommended.\n\n \(Text("The recommend Goal would Be Normal / Healthly BMI between 19 to 24 for BMI Value").bold().foregroundColor(.green))")
        } else {
            return Text("\(Text("It's essential to prioritize your health by consulting with a healthcare professional or a registered dietitian.").bold().foregroundColor(.red)) They can provide personalized guidance and support to help you manage your weight, improve your overall health, and reduce the risk of obesity-related complications.\n\n\(Text("The recommend Goal would Be Over-weight BMI between 30 to 36 for BMI Value").bold().foregroundColor(.green))")
        }
    }
    
    @State private var selectedWeightCategoryIndex = 0
    let weightCategories = ["Select Goal         ", "Underweight         ", "Normal              ", "Overweight          ", "Obese               "]
    
    let nutrientData: [[Nutrient]] = [
        [], // Select Goal
        [   // Underweight
            Nutrient(name: "Protein", value: "100g"),
            Nutrient(name: "Carbohydrates", value: "150g"),
            Nutrient(name: "Fat", value: "50g"),
            Nutrient(name: "Fiber", value: "25g"),
            Nutrient(name: "Calcium", value: "1000mg"),
            Nutrient(name: "Iron", value: "18mg")
        ],
        [   // Normal
            Nutrient(name: "Protein", value: "120g"),
            Nutrient(name: "Carbohydrates", value: "180g"),
            Nutrient(name: "Fat", value: "60g"),
            Nutrient(name: "Fiber", value: "30g"),
            Nutrient(name: "Calcium", value: "1200mg"),
            Nutrient(name: "Iron", value: "20mg")
        ],
        [   // Overweight
            Nutrient(name: "Protein", value: "110g"),
            Nutrient(name: "Carbohydrates", value: "160g"),
            Nutrient(name: "Fat", value: "55g"),
            Nutrient(name: "Fiber", value: "27g"),
            Nutrient(name: "Calcium", value: "1100mg"),
            Nutrient(name: "Iron", value: "19mg")
        ],
        [   // Obese
            Nutrient(name: "Protein", value: "100g"),
            Nutrient(name: "Carbohydrates", value: "140g"),
            Nutrient(name: "Fat", value: "45g"),
            Nutrient(name: "Fiber", value: "20g"),
            Nutrient(name: "Calcium", value: "900mg"),
            Nutrient(name: "Iron", value: "17mg")
        ]
    ]
    
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
                .animation(Animation.easeInOut(duration: 0.8).delay(1))
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(1))
                )
                
                // Recommend Goal to Achieve Text with animation and custom styling
                Text("Recommend Goal to Achieve")
                    .multilineTextAlignment(.center)
                    .padding(.top, 50)
                    .padding(.horizontal)
                    .font(.custom("Rockwell", size: 22))
                    .foregroundColor(.black)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1.5))

                // Vstack for Custom Recommend Goal based on the user's BMI
                VStack {
                    recommendedGoal
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                
                // Custom Styling for the BMI Container
                .frame(maxWidth: 300, maxHeight: 1000)
                .padding()
                .padding(.top, 30)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(2))
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.white)
                        .frame(maxHeight: 1000)
                        .shadow(color: Color(hex: "D3D3D3"), radius: 5, x: 5, y: 5)
                        .padding(.top, 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white)
                                .padding(.top)
                        )
                        .opacity(isAnimated ? 1.0 : 0.0)
                        .transition(.opacity)
                        .animation(Animation.easeInOut(duration: 0.8).delay(2))
                )
                
                // Recommend Goal to Achieve Text with animation and custom styling
                Text("Select a Goal From the Drop-Down That You Want to Achieve")
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                    .padding(.horizontal, 30)
                    .font(.custom("Rockwell", size: 20))
                    .foregroundColor(.black)
                    .transition(.opacity)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .animation(Animation.easeInOut(duration: 0.8).delay(2.5))
                
                // Dropdown for selecting weight categories
                Picker(selection: $selectedWeightCategoryIndex, label: Text("Select a Category")) {
                    ForEach(0..<weightCategories.count) { index in
                        Text(self.weightCategories[index])
                            .foregroundColor(.black)
                            .font(.custom("Rockwell", size: 18))
                            .padding(.vertical, 10)
                    }
                }
                .frame(maxWidth: 250, maxHeight: 100)
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color(hex: "D3D3D3"), radius: 5, x: 5, y: 5)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(3))

                VStack {
                    Text(self.weightCategories[self.selectedWeightCategoryIndex])
                        .font(.custom("Rockwell", size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Spacer()

                    // Display nutrient information for selected weight category
                    if selectedWeightCategoryIndex != 0 { // Exclude "Select Goal"
                        VStack(alignment: .leading, spacing: 20) {
                            // Header
                            HStack {
                                Text("Nutrient")
                                    .font(.custom("Rockwell", size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                                
                                Text("Value")
                                    .font(.custom("Rockwell", size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .multilineTextAlignment(.trailing)
                            }
                            .padding(.top)
                            
                            // Table to display essential nutrient information
                            ForEach(nutrientData[selectedWeightCategoryIndex], id: \.name) { nutrient in
                                HStack {
                                    Text(nutrient.name)
                                        .font(.custom("Rockwell", size: 16))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Text(nutrient.value)
                                        .font(.custom("Rockwell", size: 16))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                }
                .padding(.top, 20)
                .frame(maxWidth: 260, maxHeight: 600) // Apply frame to the VStack
                .padding()
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .opacity(isAnimated ? 1.0 : 0.0)
                .transition(.opacity)
                .animation(Animation.easeInOut(duration: 0.8).delay(3.5))
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(3.5))
                )



                Spacer()
            }
            .onAppear {
                let bmiValue = calculateBMI()
                bmiData.bmiValue = bmiValue
                bmiData.calculateBmiCategory()
            }
        }
    }
}

struct SetGoalScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SetGoalScreenView(sharedData: SharedData())
    }
}
