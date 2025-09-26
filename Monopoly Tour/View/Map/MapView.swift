//
//  MapView.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import SwiftUI
import MapKit

struct MapView: View {    
    @StateObject private var filter: LocationFilters
    @State private var selectedLocation: Location? = nil
    
    @State private var isShowingLocationSheet: Bool = false
    @State private var isShowingFilterSheet: Bool = false
    
    @Namespace private var namespace
    
    init(repository: LocationRepositoryProtocol = AppDependencies.shared.repository) {
        _filter = StateObject(wrappedValue: LocationFilters(repository: repository))
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topTrailing) {
                Map {
                    ForEach(filter.filteredLocations()) { location in
                        Annotation(location.name, coordinate: location.position) {
                            Button {
                                selectedLocation = location
                                isShowingLocationSheet.toggle()
                            } label: {
                                MapPin(location: location)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    ToolbarButton(
                        action: { isShowingFilterSheet.toggle() },
                        icon: "line.3.horizontal.decrease",
                        id: "filter",
                        namespace: namespace
                    )
                    .frame(width: 32, height: 32)
                }
            }
            .sheet(isPresented: $isShowingFilterSheet) {
                FilterSheetView(filters: filter)
            }
            .sheet(item: $selectedLocation) { location in
                LocationView(location: location, isSheet: true)
                    .safeAreaInset(edge: .top) {
                        Color.clear
                            .frame(height: 60)
                    }
            }
        }
    }
}

#Preview {
    MapView()
}
