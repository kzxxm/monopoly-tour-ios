//
//  SetCard.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import SwiftUI

struct SetCard: View {
    @ObservedObject var viewModel: ColorSetViewModel
    let set: ColorSet
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(set.name)
                    .font(.headline)
                    .foregroundStyle(Color.primary)
                
                Spacer()
                
                Text(viewModel.getLocationCounts(for: set))
                    .foregroundStyle(Color.primary.opacity(0.5))
                    .fontWeight(.light)
                    .padding(.horizontal, 4)
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(Color.primary.opacity(0.5))
                    .fontWeight(.ultraLight)
            }
            
            Spacer()
            
            ProgressView(value: viewModel.getProgress(for: set))
                .progressViewStyle(.linear)
                .tint(set.color)
        }
        .componentCardStyle()
    }
}

#Preview {
    SetCard(viewModel: ColorSetViewModel(), set: colorSets[0])
    SetCard(viewModel: ColorSetViewModel(), set: colorSets[1])
    SetCard(viewModel: ColorSetViewModel(), set: colorSets[2])
    SetCard(viewModel: ColorSetViewModel(), set: colorSets[3])
}
