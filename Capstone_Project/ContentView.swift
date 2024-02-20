//
//  ContentView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-01-31.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimated = false

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                // Life Pulse Logo
                CircleView(image: Image("Spiderman"), width: 300, height: 300)
                    .padding(.top, 50)
                    .scaleEffect(isAnimated ? 1 : 0)
                    .onAppear {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                            isAnimated = true
                        }
                    }

                // Life Pulse Text
                Text("Life Pulse")
                    .font(.custom("Rockwell", size: 30))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.top, 40)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(0.5))

                // Short Message On Life Pulse
                Text("Elevate your well-being with BMI tracking, personalized meal plans, and real-time heart monitoring. Your journey to a healthier, happier you starts here.")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding([.top, .leading, .trailing])
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1.0))

                // Slogan For Life Pulse
                Text("Pulse to Prosperity: Nourish Your Body, Know Your Heart with Life Pulse.")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .transition(.opacity)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1.5))

                // Add NavigationLink to BMIScreenView
                NavigationLink(destination: BMIScreenView()) {
                    Text("Next")
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
                        .animation(Animation.easeInOut(duration: 0.8).delay(2.0))
                }

            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "00FFFF"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
