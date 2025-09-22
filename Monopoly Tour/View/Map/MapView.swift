//
//  MapView.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import SwiftUI
import MapKit

struct MapView: View {
    let viewModel = MapViewModel(locations: locations)
    @State private var isShowingFilterSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                Map {
                    ForEach(locations) { location in
                        Annotation(location.name, coordinate: location.position) {
                            MapPin(location: location)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingFilterSheet.toggle()
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                }
            }
            .sheet(isPresented: $isShowingFilterSheet) {
                FilterSheetView(isShowingFilterSheet: $isShowingFilterSheet)
            }
        }
    }
}

#Preview {
    MapView()
}
