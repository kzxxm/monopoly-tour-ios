//
//  FilterSheetView.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import SwiftUI

struct FilterSheetView: View {
    @Binding var isShowingFilterSheet: Bool
    
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
                        isShowingFilterSheet.toggle()
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
                            SelectionListItem(text: set.name)
                        }
                        
                        
                        Text("Visited Status")
                            .font(.headline)
                            .padding(.top, 32)
                        
                        SelectionListItem(text: "Visited")
                        SelectionListItem(text: "Not visited")
                        
                        
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
    FilterSheetView(isShowingFilterSheet: .constant(true))
}
