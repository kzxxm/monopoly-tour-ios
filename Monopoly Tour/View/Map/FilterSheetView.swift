//
//  FilterSheetView.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import SwiftUI

struct FilterSheetView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var filters: LocationFilters
    
    var body: some View {
            VStack(alignment: .leading) {
                // Sheet header
                HStack {
                    Text("Filter")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(Color.primary)
                    }
                }
                .safeAreaInset(edge: .top) {
                    Color.clear
                        .frame(height: 24)
                }
                .padding(.horizontal, 24)
                
                ScrollView {
                
                    VStack(alignment: .leading) {
                        
                        Text("Colour Sets")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.top, 12)
                        
                        ForEach(colorSets) { set in
                            SelectionListItem(isSelected: Binding(
                                get: {
                                    filters.selectedColorSets.contains(set.id)
                                },
                                set: { newValue in
                                    if newValue {
                                        filters.selectedColorSets.insert(set.id)
                                    } else {
                                        filters.selectedColorSets.remove(set.id)
                                    }
                                }
                            ), text: set.name)
                        }
                        
                        
                        Text("Visited Status")
                            .font(.headline)
                            .padding(.top, 32)
                        
                        SelectionListItem(
                            isSelected: $filters.showVisited,
                            text: "Visited"
                        )
                        SelectionListItem(
                            isSelected: $filters.showUnvisited,
                            text: "Not visited"
                        )
                        
                        
                    }
                    .padding(.horizontal)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .safeAreaInset(edge: .top) {
                Color.clear
                    .frame(height: 8)
            }
        }
        .appBackground()
    }
}

#Preview {
    FilterSheetView(filters: LocationFilters())
}
