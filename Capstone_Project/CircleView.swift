//
//  CircleView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-01-31.
//

import SwiftUI

// Circle View for Images
struct CircleView: View {
    var image: Image
    var width: CGFloat
    var height: CGFloat
    
    
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 5)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleView(image: Image("Spiderman"), width: 300, height: 300)
}
