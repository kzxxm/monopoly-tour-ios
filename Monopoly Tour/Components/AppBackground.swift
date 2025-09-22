//
//  AppBackground.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 15/09/2025.
//

import SwiftUI

struct AppBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 6)
            .background(Color.appBackground)
    }
}


extension View {
    func appBackground() -> some View {
        modifier(AppBackground())
    }
}
