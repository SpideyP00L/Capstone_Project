//
//  UserLoginScreen.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-04-08.
//

import SwiftUI

struct UserLoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoggedIn = false
    @State private var isAnimated = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Life Pulse Logo
                CircleView(image: Image("WeCare_Logo"), width: 300, height: 300)
                    .background(Color.white)
                    .cornerRadius(500)
                    .padding(.top, 50)
                    .scaleEffect(isAnimated ? 1 : 0)
                    .onAppear {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                            isAnimated = true
                        }
                    }
                
                Text("Sign In")
                    .font(.custom("Rockwell", size: 40))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.top, 40)
                    .padding(.bottom, 20)
                    .scaleEffect(isAnimated ? 1.0 : 0.0)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .animation(Animation.easeInOut(duration: 0.8).delay(0.5), value: isAnimated)
                    
                CustomTextField(text: $email, placeholder: "Email", imageSystemName: "envelope", keyboardType: .emailAddress)
                    .frame(height: 50)
                    .padding(.bottom)
                    .scaleEffect(isAnimated ? 1.0 : 0.0)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1.0), value: isAnimated)
                    
                CustomSecureField(text: $password, placeholder: "Password", imageSystemName: "lock")
                    .frame(height: 50)
                    .padding(.bottom)
                    .scaleEffect(isAnimated ? 1.0 : 0.0)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1.5), value: isAnimated)
                    
                NavigationLink(destination: BMIScreenView().navigationBarHidden(true), isActive: $isLoggedIn) {
                    EmptyView()
                }
                .hidden()
                
                Button(action: signIn) {
                    Text("Sign In")
                }
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
                .animation(Animation.easeInOut(duration: 0.8).delay(2.0), value: isAnimated)
                
                HStack {
                    Text("Don't Have an Account ?")
                        .font(.title3)
                        .bold()
                    
                    NavigationLink(destination: UserRegistrationScreen().navigationBarBackButtonHidden()) {
                        Text("Sign Up")
                            .font(.title3)
                            .fontWeight(.heavy)
                            .underline()
                    }
                }
                .padding()
                .scaleEffect(isAnimated ? 1.0 : 0.0)
                .opacity(isAnimated ? 1.0 : 0.0)
                .animation(Animation.easeInOut(duration: 0.8).delay(2.5), value: isAnimated)
            }
            .padding()
            .background(Color(hex: "00FFFF"))
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func signIn() {
        // Check if email and password are not empty
        guard !email.isEmpty && !password.isEmpty else {
            alertMessage = "Please enter values in the fields."
            showAlert = true
            return
        }
        
        // Check login
        let databaseManager = DatabaseManager()
        if databaseManager.loginUser(email: email, password: password) {
            // Navigate to SavedData
            isLoggedIn = true
        } else {
            alertMessage = "Invalid email and password."
            showAlert = true
        }
    }
}

#Preview {
    UserLoginScreen()
}
