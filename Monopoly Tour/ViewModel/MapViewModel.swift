//
//  MapViewModel.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import Combine

class MapViewModel: ObservableObject {
    @Published var locations: [Location] = []
    
    init(locations: [Location]) {
        self.locations = locations
    }
}
