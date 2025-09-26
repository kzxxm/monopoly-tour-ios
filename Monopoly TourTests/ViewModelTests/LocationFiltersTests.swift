//
//  LocationFiltersTests.swift
//  Monopoly Tour Tests
//
//  Created by Kassim Mirza on 26/09/2025.
//

import Combine
import MapKit
import Testing
@testable import Monopoly_Tour

@Suite("LocationFilters Tests")
struct LocationFiltersTests {
    func createTestLocations() -> [Location] {
        let mockStorage = MockLocationStorage()
        return [
            Location(id: .oldKentRoad, name: "Old Kent Road", colorSetId: .brown, image: "test", position: CLLocationCoordinate2D(latitude: 0, longitude: 0), visited: true, storage: mockStorage),
            Location(id: .whitechapelRoad, name: "Whitechapel Road", colorSetId: .brown, image: "test", position: CLLocationCoordinate2D(latitude: 0, longitude: 0), visited: false, storage: mockStorage),
            Location(id: .theAngelIslington, name: "The Angel Islington", colorSetId: .lightBlue, image: "test", position: CLLocationCoordinate2D(latitude: 0, longitude: 0), visited: true, storage: mockStorage)
        ]
    }
    
    @Test("Filter initialization with defaults")
    func testDefaultInitialization() {
        let mockRepository = MockLocationRepository(locations: createTestLocations())
        let filters = LocationFilters(repository: mockRepository)
        
        #expect(filters.selectedColorSets.isEmpty)
        #expect(filters.showVisited == true)
        #expect(filters.showUnvisited == true)
    }
    
    @Test("Filter only visited locations")
    func testFilterOnlyVisited() {
        let mockRepository = MockLocationRepository(locations: createTestLocations())
        let filters = LocationFilters(showVisited: true, showUnvisited: false, repository: mockRepository)
        
        let filtered = filters.filteredLocations()
        
        #expect(filtered.count == 2)
        #expect(filtered.allSatisfy { $0.visited } )
    }

    @Test("Filter only unvisited locations")
    func testFilterOnlyUnvisited() {
        let mockRepository = MockLocationRepository(locations: createTestLocations())
        let filters = LocationFilters(showVisited: false, showUnvisited: true, repository: mockRepository)
        
        let filtered = filters.filteredLocations()
        
        #expect(filtered.count == 1)
        #expect(filtered.allSatisfy { !$0.visited })
    }
    
    @Test("Filter by color set")
    func testFilterByColorSet() {
        let mockRepository = MockLocationRepository(locations: createTestLocations())
        let filters = LocationFilters(selectedColorSets: [.brown], repository: mockRepository)
        
        let filtered = filters.filteredLocations()
        
        #expect(filtered.count == 2)
        #expect(filtered.allSatisfy { $0.colorSetId == .brown })
    }
    
    @Test("Filter combined - brown and visited only")
    func testFilterCombined() {
        let mockRepository = MockLocationRepository(locations: createTestLocations())
        let filters = LocationFilters(
            selectedColorSets: [.brown],
            showVisited: true,
            showUnvisited: false,
            repository: mockRepository
        )
        
        let filtered = filters.filteredLocations()
        
        #expect(filtered.count == 1)
        #expect(filtered.first?.id == .oldKentRoad)
    }
    
    @Test("Filter neither visited nor unvisited returns empty")
    func testFilterNeitherVisitedNorUnvisited() {
        let mockRepository = MockLocationRepository(locations: createTestLocations())
        let filters = LocationFilters(showVisited: false, showUnvisited: false, repository: mockRepository)
        
        let filtered = filters.filteredLocations()
        
        #expect(filtered.isEmpty)
    }
    
    @Test("Reset filters works correctly")
    func testResetFilters() {
        let mockRepository = MockLocationRepository(locations: createTestLocations())
        let filters = LocationFilters(
            selectedColorSets: [.brown, .lightBlue],
            showVisited: false,
            showUnvisited: false,
            repository: mockRepository
        )
        
        filters.resetFilters()
        
        #expect(filters.selectedColorSets.isEmpty)
        #expect(filters.showVisited == true)
        #expect(filters.showUnvisited == true)
    }
}
