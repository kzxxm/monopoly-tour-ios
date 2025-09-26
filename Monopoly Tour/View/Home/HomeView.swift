//
//  HomeView.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: ColorSetViewModel
    
    init(repository: LocationRepositoryProtocol = AppDependencies.shared.repository) {
        _viewModel = StateObject(wrappedValue: ColorSetViewModel(repository: repository))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Header
                    HStack {
                        Text("Monopoly Tour")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Spacer()
                    }
                    
                    // Stats Card
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("Total Completion")
                                .font(.headline)
                                .padding(.bottom, 3)
                            
                            HStack(spacing: 0) {
                                Text("\(viewModel.totalVisitedLocations)")
                                    .fontWeight(.heavy)
                                    .foregroundStyle(Color.componentCardEmphasisedText)
                                
                                Text(" locations visted")
                            }
                            
                            HStack(spacing: 0) {
                                Text("\(viewModel.remainingLocations)")
                                    .fontWeight(.heavy)
                                    .foregroundStyle(Color.componentCardEmphasisedText)
                                
                                Text(" to go")
                            }
                        }
                        
                        Spacer()
                        CircularProgressIndicator(progress: viewModel.completionProgress)
                    }
                    .componentCardStyle()
                    
                    // Sets Card
                    LazyVGrid(columns: GridLayout.twoColumn) {
                        ForEach(colorSets, id: \.id) { set in
                            NavigationLink {
                                SetView(set: set, viewModel: viewModel)
                            } label: {
                                SetCard(viewModel: viewModel, set: set)
                            }
                        }
                    }
                    
                    Spacer()
                }
            }
            .appBackground()
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 52)
            }
        }
    }
}

#Preview {
    HomeView()
        .background(Color.appBackground)
}
