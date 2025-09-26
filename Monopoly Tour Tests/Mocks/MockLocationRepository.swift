//
//  MockLocationRepository.swift
//  Monopoly Tour Tests
//
//  Created by Kassim Mirza on 26/09/2025.
//

import Foundation
@testable import Monopoly_Tour

class MockLocationRepository: LocationRepositoryProtocol {
    private var locations: [Location]
    
    init(locations: [Location] = []) {
        self.locations = locations
    }
    
    func getAllLocations() -> [Location] {
        return locations
    }
    
    func getLocation(by id: LocationID) -> Location? {
        return locations.first { $0.id == id }
    }
    
    func updateLocation(_ location: Location) {
        if let index = locations.firstIndex(where: { $0.id == location.id }) {
            locations[index] = location
        }
    }
    
    func getLocations(for colorSetId: ColorSetId) -> [Location] {
        return locations.filter { $0.colorSetId == colorSetId }
    }
    
    // Helper methods for testing
    func setLocations(_ locations: [Location]) {
        self.locations = locations
    }
    
    func getLocationCount() -> Int {
        return locations.count
    }
}
