//
//  LocationStorageTests.swift
//  Monopoly Tour Tests
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 26/09/2025.
//

import MapKit
import Testing
@testable import Monopoly_Tour

@Suite("LocationStorage Tests")
struct LocationStorageProtocolTests {
    
    @Test("Mock storage saves and retrieves successfully")
    func testMockStorage() {
        let mockStorage = MockLocationStorage()
        
        mockStorage.saveVisitedState(for: .oldKentRoad, visited: true)
        let retrieved = mockStorage.getVisitedState(for: .oldKentRoad, defaultValue: false)
        
        #expect(retrieved == true)
    }
    
    @Test("Location uses injected storage")
    func testLocationUsesInjectedStorage() {
        let mockStorage = MockLocationStorage()
        
        mockStorage.saveVisitedState(for: .parkLane, visited: true)
        
        let location = Location(
            id: .parkLane,
            name: "Park Lane",
            colorSetId: .blue,
            image: "test",
            position: CLLocationCoordinate2D(latitude: 51.5079, longitude: -0.1586),
            storage: mockStorage
        )
        
        #expect(location.visited == true)
    }
    
    @Test("Location toggle visit saves to injected storage")
    func testLocationToggleSavesToStorage() {
        let mockStorage = MockLocationStorage()
        
        let location = Location(
            id: .oxfordStreet,
            name: "Oxford Street",
            colorSetId: .green,
            image: "oxford-street",
            position: CLLocationCoordinate2D(latitude: 51.5154, longitude: -0.1410),
            storage: mockStorage
        )
        
        location.toggleVisit()
        
        let savedState = mockStorage.getVisitedState(for: .oxfordStreet, defaultValue: false)
        #expect(savedState == true)
        #expect(location.visited == true)
    }
}
