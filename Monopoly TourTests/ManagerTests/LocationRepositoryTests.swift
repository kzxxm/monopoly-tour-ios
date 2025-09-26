//
//  LocationRepositoryTests.swift
//  Monopoly Tour Tests
//
//  Created by Kassim Mirza on 26/09/2025.
//

import MapKit
import Testing
@testable import Monopoly_Tour

@Suite("LocationRepository Tests")
struct LocationRepositoryTests {
    
    @Test("Repository initializes with all default locations")
    func testRepositoryInitialization() {
        let mockStorage = MockLocationStorage()
        let repository = LocationRepository(storage: mockStorage)
        
        let allLocations = repository.getAllLocations()
        
        // Check all locations exist
        #expect(allLocations.count == 27)
        
        // Check that a few specific locations exist
        #expect(allLocations.contains { $0.id == .leicesterSquare })
        #expect(allLocations.contains { $0.id == .mayfair })
        #expect(allLocations.contains { $0.id == .northumberlandAvenue })
    }
    
    @Test("Mock repository works correctly")
    func testMockRepository() {
        let mockStorage = MockLocationStorage()
        let testLocation = Location(
            id: .towerOfLondon,
            name: "Tower of London",
            colorSetId: .jail,
            image: "test",
            position: CLLocationCoordinate2D(latitude: 51.5081, longitude: -0.0759),
            storage: mockStorage
        )
        
        let mockRepository = MockLocationRepository(locations: [testLocation])
        
        #expect(mockRepository.getAllLocations().count == 1)
        #expect(mockRepository.getLocation(by: .towerOfLondon)?.name == "Tower of London")
    }
    
    @Test("Get location by ID")
    func testGetLocationByID() {
        let mockStorage = MockLocationStorage()
        let repository = LocationRepository(storage: mockStorage)
        
        let location = repository.getLocation(by: .kingsCross)
        
        #expect(location != nil)
        #expect(location?.id == .kingsCross)
        #expect(location?.name != "Kings Cross")
    }
    
    @Test("Get locations by color set")
    func testGetLocationsByColorSet() {
        let mockStorage = MockLocationStorage()
        let repository = LocationRepository(storage: mockStorage)
        
        let redLocations = repository.getLocations(for: .red)
        
        #expect(redLocations.count == 3)
        #expect(redLocations.allSatisfy {$0.colorSetId == .red} )
    }
    
    @Test("Update location")
    func testUpdateLocation() {
        let mockStorage = MockLocationStorage()
        let repository = LocationRepository(storage: mockStorage)
        
        guard let location = repository.getLocation(by: .fleetStreet) else {
            #expect(Bool(false), "Location should exist")
            return
        }
        
        // Change the visited state
        let originalVisited = location.visited
        location.toggleVisit()
        
        // Update in repository
        repository.updateLocation(location)
        
        // Verify the change
        let updatedLocation = repository.getLocation(by: .fleetStreet)
        #expect(updatedLocation?.visited == !originalVisited)
    }
}
