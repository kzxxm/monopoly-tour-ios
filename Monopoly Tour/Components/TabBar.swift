//
//  TabBar.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                content
            }
            .padding(.vertical)
            .background(Color.tabBarBackground)
            .clipShape(RoundedRectangle(cornerRadius: 45))
            .padding(.horizontal)
            .shadow(radius: 8)
        }
    }
    
    var content: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation {
                    selectedTab = item.tab
                }
            } label: {
                Image(systemName: item.icon)
                    .frame(width: 32, height: 32)
                    .foregroundStyle(item.tab == selectedTab ? Color.tabBarIconSelected : Color.tabBarIconUnselected)
                    .padding(.horizontal, 20)
            }
        }
    }
}

struct TabItem: Identifiable {
    var id = UUID()
    let tab: Tab
    let name: String
    let icon: String
}

enum Tab {
    case home
    case places
    case map
    
    var index: Int {
        switch self {
            case .home: return 0
            case .places: return 1
            case .map: return 2
        }
    }
}

let tabItems = [
    TabItem(tab: .home, name: "Home", icon: "house"),
    TabItem(tab: .places, name: "Places", icon: "mappin"),
    TabItem(tab: .map, name: "Map", icon: "map"),
]

#Preview {
    TabBar(selectedTab: .constant(.home))
}
