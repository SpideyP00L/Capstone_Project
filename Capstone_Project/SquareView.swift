//
//  SquareView.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-01-31.
//

import SwiftUI

// Square View For Images
struct SquareView: View {
    var image: Image

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.white)
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay {
                    RoundedRectangle(cornerRadius: 30).stroke(.white, lineWidth: 5)
                }
                .shadow(radius: 7)

            image
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white, lineWidth: 5)
                }
        }
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(image: Image("Female"))
    }
}
