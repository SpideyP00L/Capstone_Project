//
//  MealPlanScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-04.
//

import SwiftUI

struct MealPlanScreenView: View {
    @State private var isAnimated = false
    
    var body: some View {
        ScrollView {
            VStack {
                // Title Text
                Text("Meal Plan")
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
            }
        }
    }
}

#Preview {
    MealPlanScreenView()
}
