//
//  SelectionListItem.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import SwiftUI

struct SelectionListItem: View {
    @Binding var isSelected: Bool
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
            
            Spacer()
            
            Button {
                isSelected.toggle()
            } label: {
                Image(systemName: isSelected ? "checkmark.square" : "square")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 42)
                    .foregroundStyle(Color.primary)
                    .contentTransition(.symbolEffect(.replace))
            }
        }
    }
}

#Preview {
    SelectionListItem(isSelected: .constant(false), text: "Placeholder")
    SelectionListItem(isSelected: .constant(true), text: "Placeholder")
}
