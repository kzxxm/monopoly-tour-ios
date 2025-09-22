//
//  ContentView.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ColorSetViewModel(locations: locations)
    @State private var selectedTab = Tab.home
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            Group {
                switch selectedTab {
                case .home:
                    HomeView(viewModel: viewModel)
                        .transition(
                            .push(from: .leading)
                        )
                case .places:
                    Text("Places")
                        .transition(
                            .push(from: selectedTab.index > 1 ? .leading : .trailing)
                        )
                case .map:
                    MapView()
                        .transition(
                            .push(from: selectedTab.index > 2 ? .leading : .trailing)
                        )
                case .settings:
                    Text("Settings")
                        .transition(
                            .push(from: .trailing)
                        )
                }
            }
            
            TabBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}
