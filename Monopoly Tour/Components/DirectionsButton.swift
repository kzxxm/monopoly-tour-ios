//
//  DirectionsButton.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import SwiftUI

struct DirectionsButton: View {
    let text: String
    let icon: String?
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 0) {
                Text(text)
                    .font(.footnote)
                    .padding(.leading)
                Image(systemName: icon ?? "")
                    .font(.title3)
                    .frame(width: 44, height: 44)
            }
            .foregroundStyle(Color.white)
            .background(Color.tabBarBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(radius: 4)
        }
    }
}

#Preview {
    DirectionsButton(text: "Walk", icon: "figure.walk", action: {})
}
