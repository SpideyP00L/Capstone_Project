//
//  ProfileScreenView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-02-02.
//

import SwiftUI

struct ProfileScreenView: View {
    var body: some View {
        VStack {
            Text("Profile Screen")
                .font(.custom("Rockwell", size: 26))
            
            Rectangle()
                .frame(height: 4)
                .foregroundColor(Color.black)
                .padding(.top, 2.0)
                .padding(.horizontal, 30)
        }
    }
}

#Preview {
    ProfileScreenView()
}
