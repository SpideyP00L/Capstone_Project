//
//  UserRegistrationScreen.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-04-08.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let placeholder: String
    let imageSystemName: String
    let keyboardType: UIKeyboardType
    
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
                .padding(.leading, 8)
            
            if keyboardType == .numberPad {
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 15)
                    .onChange(of: text) { _ in
                        // Filter out non-numeric characters
                        self.text = self.text.filter { $0.isNumber }
                    }
            } else {
                TextField(placeholder, text: $text)
                    .keyboardType(keyboardType)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 15)
            }
        }
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding(.vertical, 5)
    }
}

struct CustomSecureField: View {
    @Binding var text: String
    let placeholder: String
    let imageSystemName: String
    
    var body: some View {
        HStack {
            Image(systemName: imageSystemName)
                .padding(.leading, 8)
            
            if isVisible {
                TextField(placeholder, text: $text)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 15)
            } else {
                SecureField(placeholder, text: $text)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 15)
            }
            
            // Toggle visibility button
            Button(action: {
                // Toggle the visibility of the password
                self.isVisible.toggle()
            }) {
                Image(systemName: isVisible ? "eye.slash" : "eye")
                    .padding(.trailing, 8)
            }
        }
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1)
        )
        .padding(.vertical, 5)
    }
    
    @State private var isVisible: Bool = false
}

struct UserRegistrationScreen: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var phoneNumber = ""
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
    @State private var registrationSuccess = false
    @State private var navigateToLogin = false
    @State private var isAnimated = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // Life Pulse Logo
                CircleView(image: Image("WeCare_Logo"), width: 200, height: 200)
                    .background(Color.white)
                    .cornerRadius(500)
                    .padding(.top, 50)
                    .scaleEffect(isAnimated ? 1 : 0)
                    .onAppear {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0.8)) {
                            isAnimated = true
                        }
                    }
                
                Text("Sign Up")
                    .font(.custom("Rockwell", size: 40))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .scaleEffect(isAnimated ? 1.0 : 0.0)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .animation(Animation.easeInOut(duration: 0.8).delay(0.5), value: isAnimated)
                
                CustomTextField(text: $username, placeholder: "Username", imageSystemName: "person", keyboardType: .default)
                    .frame(height: 50)
                    .scaleEffect(isAnimated ? 1.0 : 0.0)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1.0), value: isAnimated)
                
                CustomTextField(text: $email, placeholder: "Email", imageSystemName: "envelope", keyboardType: .emailAddress)
                    .frame(height: 50)
                    .scaleEffect(isAnimated ? 1.0 : 0.0)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .animation(Animation.easeInOut(duration: 0.8).delay(1.5), value: isAnimated)
                
                CustomTextField(text: $phoneNumber, placeholder: "Phone Number", imageSystemName: "phone", keyboardType: .numberPad)
                    .frame(height: 50)
                    .scaleEffect(isAnimated ? 1.0 : 0.0)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .animation(Animation.easeInOut(duration: 0.8).delay(2.0), value: isAnimated)
                
                CustomSecureField(text: $password, placeholder: "Password", imageSystemName: "lock")
                    .frame(height: 50)
                    .scaleEffect(isAnimated ? 1.0 : 0.0)
                    .opacity(isAnimated ? 1.0 : 0.0)
                    .animation(Animation.easeInOut(duration: 0.8).delay(2.5), value: isAnimated)
                
                Button("Sign Up") {
                    // Check for validation
                    validateData()
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
                .animation(Animation.easeInOut(duration: 0.8).delay(3.0), value: isAnimated)
                
                HStack {
                    Text("Account already created ?")
                        .font(.title3)
                        .bold()
                    
                    NavigationLink(destination: UserLoginScreen().navigationBarHidden(true)) {
                        Text("Sign In")
                            .font(.title3)
                            .fontWeight(.heavy)
                            .underline()
                    }
                }
                .padding()
                .scaleEffect(isAnimated ? 1.0 : 0.0)
                .opacity(isAnimated ? 1.0 : 0.0)
                .animation(Animation.easeInOut(duration: 0.8).delay(3.5), value: isAnimated)
                
            }
            .padding()
            .background(Color(hex: "00FFFF"))
            .navigationBarTitle("")
            .alert(isPresented: $isShowingAlert) {
                if registrationSuccess {
                    return Alert(title: Text("Success"), message: Text("Your Registration is Done, Please Login"), dismissButton: .default(Text("OK")) {
                        // Navigate to LoginScreen after successful registration
                        navigateToLogin = true
                    })
                } else {
                    return Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
            }
            .background(
                NavigationLink("", destination: UserLoginScreen(), isActive: $navigateToLogin)
            )
        }
        .padding(.bottom, 20)
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func validateData() {
        // Reset alert message
        alertMessage = ""
        
        // Check if all fields are empty
        if username.isEmpty && email.isEmpty && phoneNumber.isEmpty && password.isEmpty {
            alertMessage = "Please fill in all the fields."
            isShowingAlert = true
            return
        }
        
        // Validate username
        if username.isEmpty {
            alertMessage = "Username is required."
            isShowingAlert = true
            return
        }
        
        // Validate email
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if !emailPredicate.evaluate(with: email) {
            alertMessage = "Invalid email format. Please enter a valid email address (e.g., example@example.com)."
            isShowingAlert = true
            return
        }
        
        // Validate phone number
        if phoneNumber.count != 10 || !phoneNumber.allSatisfy({ $0.isNumber }) {
            alertMessage = "Phone number should be 10 digits."
            isShowingAlert = true
            return
        }
        
        // Validate password
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        if !passwordPredicate.evaluate(with: password) {
            alertMessage = "Password should be 8 characters with at least one uppercase letter, one lowercase letter, and one digit."
            isShowingAlert = true
            return
        }
        
        // If all validations passed, save user data
        saveUserData()
    }
    
    private func saveUserData() {
        // Initialize DatabaseManager
        let dbManager = DatabaseManager()
                
        // Save user data
        dbManager.saveUser(username: username, email: email, phoneNumber: phoneNumber, password: password)
        
        registrationSuccess = true
        isShowingAlert = true
    }
}

#Preview {
    UserRegistrationScreen()
}
