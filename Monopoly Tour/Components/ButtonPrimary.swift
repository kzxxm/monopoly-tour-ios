//
//  ButtonPrimary.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import SwiftUI

struct ButtonPrimary: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.tabBarBackground)
                    .frame(width: .infinity, height: 50)
                
                Text(text)
                    .foregroundStyle(Color.tabBarIconSelected)
                    .fontWeight(.medium)
            }
        }
    }
}

#Preview {
    ButtonPrimary(text: "Button text", action: {})
}
