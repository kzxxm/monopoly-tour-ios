//
//  SelectionListItem.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import SwiftUI

struct SelectionListItem: View {
    @State private var isSelected = false
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
    SelectionListItem(text: "Placeholder")
}
