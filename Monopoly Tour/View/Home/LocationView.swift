//
//  LocationView.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import MapKit
import SwiftUI

struct LocationView: View {
    @ObservedObject var location: Location
    let viewModel: PositionViewModel
    
    init(location: Location) {
        self.location = location
        self.viewModel = PositionViewModel(location: location)
    }
        
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            ZStack(alignment: .bottomTrailing) {
                Map(
                    initialPosition: MapCameraPosition.region(viewModel.region),
                    interactionModes: []
                ) {
                    Annotation(location.name, coordinate: location.position) {
                        MapPin(location: location)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 500)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                DirectionsButton(text: "Walk", icon: "figure.walk", action: viewModel.openDirections)
                    .padding(.bottom, 8)
                    .padding(.trailing, 8)
            }
            
            ButtonPrimary(
                text: location.visited ? "Mark location as unvisited" : "Mark location as visited",
                action: {
                    viewModel.toggleVisited(for: location)
                }
            )
            
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.appBackground)
    }
}

#Preview {
    LocationView(location: locations[0])
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 52)
        }
}
