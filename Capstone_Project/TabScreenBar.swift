//
//  TabScreenBar.swift
//  Capstone_Project
//
//  Created by Jeet Panchal on 2024-03-03.
//

import SwiftUI

struct TabScreenBar: View {
    // View Property
    @State private var activeTab: Tab = .home
    @State private var tabShapePosition: CGPoint = .zero
    @ObservedObject var sharedData: SharedData = SharedData()
    @ObservedObject var bmiData = BMIData()
    
    // Smooth Shape Sliding Effect
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 0) {
                    TabView(selection: $activeTab) {
                        HomeScreenView(sharedData: sharedData)
                            .tag(Tab.home)

                        UpdateBMIScreenView(sharedData: sharedData)
                            .tag(Tab.bmi)

                        SetGoalScreenView()
                            .tag(Tab.setGoal)

                        HeartMonitorScreenView(sharedData: sharedData)
                            .tag(Tab.heart)
                        
                        MealPlanScreenView()
                            .tag(Tab.meal)
                    }
                    CustomTabBar()
                        .frame(maxHeight: 0)
                        .padding(.bottom, 50)
                        
                }
                .navigationBarBackButtonHidden(true)
            }
    
    
    // Custom Tab Bar
    func CustomTabBar(_ tint:Color = Color("Blue"), _ inactiveTint:Color = .blue) ->
    some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem (
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab,
                    position: $tabShapePosition
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            TabShape(midpoint: tabShapePosition.x)
                .fill(.white)
                // Adding Blur and Shadow for Shape smoothening
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y:-5)
                .blur(radius: 2)
                .padding(.top, 25)
        })
        
        // Adding Animation
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}


//Tab Bar Items
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    
    // Each Tab Item Position in the Screen
    @State private var tabPosition: CGPoint = .zero
    
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
                .frame(width: activeTab == tab ? 60 : 35, height: activeTab == tab ? 60 : 35)
                .background{
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            
            // Updating Active Tab Position
            if activeTab == tab {
                position.x = rect.midX
            }
            
        })
        .onTapGesture {
            activeTab = tab
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        TabScreenBar()
    }
}
