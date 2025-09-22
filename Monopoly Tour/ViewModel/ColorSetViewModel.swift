//
//  ColorSetViewModel.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import Combine
import SwiftUI

class ColorSetViewModel: ObservableObject {
    @Published var locations: [Location]
    
    var totalLocations: Int {
        locations.count
    }
    
    var totalVisitedLocations: Int {
        locations.filter { $0.visited }.count
    }
    
    var remainingLocations: Int {
        totalLocations - totalVisitedLocations
    }
    
    var completionProgress: Double {
        Double(totalVisitedLocations) / Double(totalLocations)
    }
    
    init(locations: [Location]) {
        self.locations = locations
    }
    
    func locations(for colorSet: ColorSet) -> [Location] {
        locations.filter { $0.colorSetId == colorSet.id }
    }
    
    func getLocationCounts(for colorSet: ColorSet) -> String {
        let setLocations = locations.filter { $0.colorSetId == colorSet.id }
        let visitedCount = setLocations.filter { $0.visited }.count
        let totalCount = setLocations.count
        return "\(visitedCount) / \(totalCount)"
    }
    
    func getProgress(for colorSet: ColorSet) -> Double {
        let setLocations = locations.filter { $0.colorSetId == colorSet.id }
        let visitedCount = setLocations.filter { $0.visited }.count
        let totalCount = setLocations.count
        return totalCount > 0 ? Double(visitedCount) / Double(totalCount) : 0.0
    }
    
    func toggleVisited(for location: Location) {
        if let index = locations.firstIndex(where: { $0.id == location.id }) {
            locations[index].toggleVisit()
            LocationStorage.saveVisitedState(for: location.id, visited: locations[index].visited)
            objectWillChange.send()
        }
    }
}
