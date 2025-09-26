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
    private let repository: LocationRepositoryProtocol
    
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
        guard totalLocations > 0 else { return 0.0 }
        return Double(totalVisitedLocations) / Double(totalLocations)
    }
    
    init(repository: LocationRepositoryProtocol = LocationRepository(storage: LocationStorage())) {
        self.repository = repository
        self.locations = repository.getAllLocations()
    }
    
    func locations(for colorSet: ColorSet) -> [Location] {
        return repository.getLocations(for: colorSet.id)
    }
    
    func getLocationCounts(for colorSet: ColorSet) -> String {
        let setLocations = repository.getLocations(for: colorSet.id)
        let visitedCount = setLocations.filter { $0.visited }.count
        let totalCount = setLocations.count
        return "\(visitedCount) / \(totalCount)"
    }
    
    func getProgress(for colorSet: ColorSet) -> Double {
        let setLocations = repository.getLocations(for: colorSet.id)
        let visitedCount = setLocations.filter { $0.visited }.count
        let totalCount = setLocations.count
        return totalCount > 0 ? Double(visitedCount) / Double(totalCount) : 0.0
    }
    
    func toggleVisited(for location: Location) {
        location.toggleVisit()
        repository.updateLocation(location)
        
        if let index = locations.firstIndex(where: { $0.id == location.id }) {
            locations[index] = location
        }
        
        objectWillChange.send()
    }
    
    // Helper method for tests
    func refreshLocations() {
        locations = repository.getAllLocations()
    }
}
