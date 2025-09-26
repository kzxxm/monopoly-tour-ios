//
//  SetView.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 15/09/2025.
//

import SwiftUI

struct SetView: View {
    let set: ColorSet
    let viewModel: ColorSetViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                
                // Header
                HStack {
                    Circle()
                        .fill(set.color)
                        .frame(width: 12, height: 12)
                        .padding(.leading)
                    
                    Text(set.name)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                    
                    Spacer()
                }
                
                // Locations
                VStack {
                    ForEach(viewModel.locations(for: set), id: \.id) { location in
                        NavigationLink {
                            LocationView(location: location)
                        } label: {
                            LocationCard(location: location, viewModel: viewModel)
                        }
                    }
                }
                
                Spacer()
            }
        }
        .appBackground()
        .safeAreaInset(edge: .bottom) {
            Color.clear.frame(height: 50)
        }
    }
}

#Preview {
    SetView(set: colorSets[0], viewModel: ColorSetViewModel())
}
