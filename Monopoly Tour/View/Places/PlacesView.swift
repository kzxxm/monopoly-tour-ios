//
//  PlacesView.swift
//  Monopoly Tour
//
//  Created by Kassim Mirza on 25/09/2025.
//

import SwiftUI

struct PlacesView: View {
    @StateObject private var viewModel: ColorSetViewModel
    @StateObject private var filter: LocationFilters
    @State private var isShowingFilterSheet = false
    @Namespace private var namespace
    
    init(repository: LocationRepositoryProtocol = AppDependencies.shared.repository) {
        _viewModel = StateObject(wrappedValue: ColorSetViewModel(repository: repository))
        _filter = StateObject(wrappedValue: LocationFilters(repository: repository))
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Places")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                    
                    Spacer()
                }
                
                ScrollView {
                    
                    ForEach(filter.filteredLocations()) { location in
                        NavigationLink {
                            LocationView(location: location)
                        } label: {
                            LocationCard(location: location, viewModel: viewModel)
                        }
                    }
                }
                
                Spacer()
            }
            .appBackground()
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
        }
    }
}

#Preview {
    PlacesView()
}
