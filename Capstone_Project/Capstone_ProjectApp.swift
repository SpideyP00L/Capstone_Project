//
//  Capstone_ProjectApp.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-01-31.
//

import SwiftUI

@main
struct Capstone_ProjectApp: App {
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
