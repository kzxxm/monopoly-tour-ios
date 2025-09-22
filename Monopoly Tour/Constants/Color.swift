//
//  Color.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import SwiftUI

extension Color {
    // Helper function for Dynamic Colors
    static func dynamicColor(light: Color, dark: Color) -> Color {
        return Color(UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return UIColor(dark)
            default:
                return UIColor(light)
            }
        })
    }
    
    // App Background
    static let appBackground = dynamicColor(
        light: Color(red: 200/255, green: 210/255, blue: 220/255),
        dark: Color(red: 28/255, green: 28/255, blue: 30/255)
    )
    
    // Color Sets
    static let brownSet = Color(red: 139/255, green: 69/255, blue: 19/255)
    static let lightBlueSet = Color(red: 173/255, green: 216/255, blue: 230/255)
    static let pinkSet = Color(red: 255/255, green: 192/255, blue: 203/255)
    static let orangeSet = Color(red: 255/255, green: 165/255, blue: 0/255)
    static let redSet = Color(red: 255/255, green: 0/255, blue: 0/255)
    static let yellowSet = Color(red: 255/255, green: 234/255, blue: 0/255)
    static let greenSet = Color(red: 0/255, green: 128/255, blue: 0/255)
    static let blueSet = Color(red: 0/255, green: 0/255, blue: 255/255)
    static let stationsSet = Color.black
    static let jailSet = Color(red: 128/255, green: 128/255, blue: 128/255)
    
    // Tab Bar
    static let tabBarBackground = dynamicColor(
        light: Color(red: 74/255, green: 83/255, blue: 103/255),
        dark: Color(red: 44/255, green: 55/255, blue: 74/255)
    )
    static let tabBarIconSelected = Color.white
    static let tabBarIconUnselected = Color.white.opacity(0.5)
    
    // Component Cards
    static let componentCardBackground = dynamicColor(
        light: Color.white,
        dark: Color(red: 44/255, green: 44/255, blue: 46/255)
    )
    
    // Circular Progress Indicator
    static let circularIndicator = dynamicColor(
        light: Color(red: 74/255, green: 83/255, blue: 103/255),
        dark: Color(red: 94/255, green: 103/255, blue: 123/255)
    )
    static let circularIndicatorBackground = dynamicColor(
        light: Color(red: 74/255, green: 83/255, blue: 103/255).opacity(0.1),
        dark: Color(red: 94/255, green: 103/255, blue: 123/255).opacity(0.2)
    )
    
    // Map Button
    static let mapButtonBackground = dynamicColor(
        light: Color(red: 44/255, green: 55/255, blue: 74/255),
        dark: Color(red: 200/255, green: 210/255, blue: 220/255)
    )
    
    // Visited/Unvisited Icons
    static let visited = Color.green
    static let notVisited = Color.black.opacity(0.5)
}
