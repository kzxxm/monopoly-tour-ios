//
//  LocationFilters.swift
//  Monopoly Tour
//
//  Created by Kassim Mirza on 23/09/2025.
//

import Combine
import SwiftUI

class LocationFilters: ObservableObject {
    @Published var selectedColorSets = Set<ColorSetId>()
    @Published var showVisited: Bool
    @Published var showUnvisited: Bool
    
    var filteredSets: [ColorSetId] {
        Array(selectedColorSets)
    }
    
    init(selectedColorSets: Set<ColorSetId> = Set<ColorSetId>(), showVisited: Bool = true, showUnvisited: Bool = true) {
        self.selectedColorSets = selectedColorSets
        self.showVisited = showVisited
        self.showUnvisited = showUnvisited
    }
    
    func filteredLocations() -> [Location] {
        var locationsFiltered = locations
                    
        // Only visited
        if showVisited && !showUnvisited {
            locationsFiltered = locationsFiltered.filter { $0.visited }
        
        // Only unvisited
        } else if showUnvisited && !showVisited {
            locationsFiltered = locationsFiltered.filter { !$0.visited }
            
        // Neither selected
        } else if !showVisited && !showUnvisited {
            return []
        }
                
        // Filters for color selections
        if !selectedColorSets.isEmpty {
            locationsFiltered = locationsFiltered.filter { selectedColorSets.contains($0.colorSetId) }
        }
        
        return locationsFiltered
    }
}
