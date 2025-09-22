//
//  ColorSet.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import Foundation
import SwiftUI

struct ColorSet: Identifiable {
    let id: ColorSetId
    let name: String
    let color: Color
    
    init(id: ColorSetId, name: String, color: Color) {
        self.id = id
        self.name = name
        self.color = color
    }
}

enum ColorSetId: String, CaseIterable {
    case brown
    case lightBlue
    case pink
    case orange
    case red
    case yellow
    case green
    case blue
    case stations
    case jail
    
    var color: Color {
        switch self {
        case .brown:
            return .brownSet
        case .lightBlue:
            return .lightBlueSet
        case .pink:
            return .pinkSet
        case .orange:
            return .orangeSet
        case .red:
            return .redSet
        case .yellow:
            return .yellowSet
        case .green:
            return .greenSet
        case .blue:
            return .blueSet
        case .stations:
            return .stationsSet
        case .jail:
            return .jailSet
        }
    }
}

let colorSets: [ColorSet] = [
    ColorSet(id: .brown, name: "Brown", color: .brownSet),
    ColorSet(id: .lightBlue, name: "Light Blue", color: .lightBlueSet),
    ColorSet(id: .pink, name: "Pink", color: .pinkSet),
    ColorSet(id: .orange, name: "Orange", color: .orangeSet),
    ColorSet(id: .red, name: "Red", color: .redSet),
    ColorSet(id: .yellow, name: "Yellow", color: .yellowSet),
    ColorSet(id: .green, name: "Green", color: .greenSet),
    ColorSet(id: .blue, name: "Blue", color: .blueSet),
    ColorSet(id: .stations, name: "Stations", color: .stationsSet),
    ColorSet(id: .jail, name: "Jail", color: .jailSet)
]
