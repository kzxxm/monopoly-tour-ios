//
//  ComponentCard.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import SwiftUI

struct ComponentCardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.componentCardBackground)
            .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

extension View {
    func componentCardStyle() -> some View {
        modifier(ComponentCardStyle())
    }
}
