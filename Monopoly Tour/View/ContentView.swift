//
//  ContentView.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = Tab.home
    @State private var previousTab = Tab.home
    
    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()
            
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                        .transition(
                            .move(edge: transitionEdge)
                        )
                case .places:
                    PlacesView()
                        .transition(
                            .move(edge: transitionEdge)
                        )
                case .map:
                    MapView()
                        .transition(
                            .move(edge: transitionEdge)
                        )
                }
            }
            .animation(.bouncy, value: transitionEdge)
            
            TabBar(selectedTab: Binding(
                get: { selectedTab },
                set: { newValue in
                    previousTab = selectedTab
                    selectedTab = newValue
                }
            ))
        }
    }
    
    private var transitionEdge: Edge {
        selectedTab.index > previousTab.index ? .trailing : .leading
    }
}

#Preview {
    ContentView()
}
