//
//  ToolbarButton.swift
//  Monopoly Tour
//
//  Created by Kassim Mirza on 24/09/2025.
//

import SwiftUI

struct ToolbarButton: View {
    let action: () -> Void
    let icon: String
    let id: String
    let namespace: Namespace.ID
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon)
                .foregroundStyle(Color.primary)
                .font(.title2)
                .frame(width: 48, height: 32)
                .padding(8)
            
        }
        .glassEffectUnion(id: id, namespace: namespace)
    }
}

#Preview {
    @Previewable @Namespace var ns
    ToolbarButton(
        action: {},
        icon: "arrow.clockwise",
        id: "reset",
        namespace: ns
    )
}
