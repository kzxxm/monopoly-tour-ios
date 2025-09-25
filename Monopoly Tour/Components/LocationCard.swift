//
//  LocationCard.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 15/09/2025.
//

import SwiftUI

struct LocationCard: View {
    @ObservedObject var location: Location
    let viewModel: ColorSetViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(location.image)
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 150)
                .clipped()
            
            VStack {
                HStack {
                    Button {
                        viewModel.toggleVisited(for: location)
                    } label: {
                        Image(systemName: location.visited ? "checkmark.circle.fill" : "circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(location.visited ? Color.visited : Color.primary)
                    }
                    .contentTransition(.symbolEffect(.replace))
                    
                    Text(location.name)
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(location.colorSetId.color)
                        .padding(.trailing)
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.primary.opacity(0.5))
                        .fontWeight(.ultraLight)
                }
            }
            .padding()
        }
        .background(Color.componentCardBackground)
        
        .clipShape(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
        )
        
    }
}

#Preview {
    ScrollView {
        LocationCard(location: locations[0], viewModel: ColorSetViewModel(locations: locations))
        LocationCard(location: locations[1], viewModel: ColorSetViewModel(locations: locations))
        LocationCard(location: locations[2], viewModel: ColorSetViewModel(locations: locations))
    }
    .background(.black)
}
