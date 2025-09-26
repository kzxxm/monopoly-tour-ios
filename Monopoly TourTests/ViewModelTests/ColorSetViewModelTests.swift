//
//  ColorSetViewModelTests.swift
//  Monopoly Tour Tests
//
//  Created by Kassim Mirza on 26/09/2025.
//

import Combine
import MapKit
import Testing
@testable import Monopoly_Tour

@Suite("ColorSetViewModel Tests")
struct ColorSetViewModelTests {
    func createTestLocations() -> [Location] {
        let mockStorage = MockLocationStorage()
        return [
            Location(id: .oldKentRoad, name: "Old Kent Road", colorSetId: .brown, image: "test", position: CLLocationCoordinate2D(latitude: 0, longitude: 0), visited: true, storage: mockStorage),
            Location(id: .whitechapelRoad, name: "Whitechapel Road", colorSetId: .brown, image: "test", position: CLLocationCoordinate2D(latitude: 0, longitude: 0), visited: false, storage: mockStorage),
            Location(id: .theAngelIslington, name: "The Angel", colorSetId: .lightBlue, image: "test", position: CLLocationCoordinate2D(latitude: 0, longitude: 0), visited: true, storage: mockStorage),
            Location(id: .eustonRoad, name: "Euston Road", colorSetId: .lightBlue, image: "test", position: CLLocationCoordinate2D(latitude: 0, longitude: 0), visited: false, storage: mockStorage)
        ]
    }
    
    @Test("ViewModel initialization loads locations from repository")
    func testInitialization() {
        let testLocations = createTestLocations()
        let mockRepository = MockLocationRepository(locations: testLocations)
        let viewModel = ColorSetViewModel(repository: mockRepository)
        
        #expect(viewModel.locations.count == 4)
        #expect(viewModel.totalLocations == 4)
    }
    
    @Test("Computed properties calculate correctly")
    func testComputedProperties() {
        let testLocations = createTestLocations()
        let mockRepository = MockLocationRepository(locations: testLocations)
        let viewModel = ColorSetViewModel(repository: mockRepository)
        
        #expect(viewModel.totalLocations == 4)
        #expect(viewModel.totalVisitedLocations == 2)
        #expect(viewModel.remainingLocations == 2)
        #expect(viewModel.completionProgress == 0.5)
    }
    
    @Test("Completion progress handles zero locations")
    func testCompletionProgressZeroLocations() {
        let mockRepository = MockLocationRepository(locations: [])
        let viewModel = ColorSetViewModel(repository: mockRepository)
        
        #expect(viewModel.completionProgress == 0.0)
    }
    
    @Test("Get locations for specific color set")
    func testLocationsForColorSet() {
        let testLocations = createTestLocations()
        let mockRepository = MockLocationRepository(locations: testLocations)
        let viewModel = ColorSetViewModel(repository: mockRepository)
        let brownColorSet = ColorSet(id: .brown, name: "Brown", color: .brownSet)
        
        let brownLocations = viewModel.locations(for: brownColorSet)
        
        #expect(brownLocations.count == 2)
        #expect(brownLocations.allSatisfy { $0.colorSetId == .brown })
    }
    
    @Test("Get location counts for color set")
    func testLocationCounts() {
        let testLocations = createTestLocations()
        let mockRepository = MockLocationRepository(locations: testLocations)
        let viewModel = ColorSetViewModel(repository: mockRepository)
        let brownColorSet = ColorSet(id: .brown, name: "Brown", color: .brownSet)
        
        let counts = viewModel.getLocationCounts(for: brownColorSet)
        #expect(counts == "1 / 2")
    }
    
    @Test("Get progress for color set")
    func testProgressForColorSet() {
        let testLocations = createTestLocations()
        let mockRepository = MockLocationRepository(locations: testLocations)
        let viewModel = ColorSetViewModel(repository: mockRepository)
        let brownColorSet = ColorSet(id: .brown, name: "Brown", color: .brownSet)
        
        let progress = viewModel.getProgress(for: brownColorSet)
        #expect(progress == 0.5)
    }
        
    @Test("Get progress for color set with no locations")
    func testProgressForEmptyColorSet() {
        let mockRepository = MockLocationRepository(locations: [])
        let viewModel = ColorSetViewModel(repository: mockRepository)
        let brownColorSet = ColorSet(id: .brown, name: "Brown", color: .brownSet)
        
        let progress = viewModel.getProgress(for: brownColorSet)
        #expect(progress == 0.0)
    }
    
    @Test("Toggle visited updates location and repository")
    func testToggleVisited() {
        let testLocations = createTestLocations()
        let mockRepository = MockLocationRepository(locations: testLocations)
        let viewModel = ColorSetViewModel(repository: mockRepository)
        
        guard let whitechapelLocation = testLocations.first(where: { $0.id == .whitechapelRoad }) else {
            #expect(Bool(false), "Should find whitechapel location")
            return
        }
        
        #expect(whitechapelLocation.visited == false)
        
        viewModel.toggleVisited(for: whitechapelLocation)
        
        #expect(whitechapelLocation.visited == true)
        
        let updatedFromRepo = mockRepository.getLocation(by: .whitechapelRoad)
        
        #expect(updatedFromRepo?.visited == true)
        
        let updatedInViewModel = viewModel.locations.first { $0.id == .whitechapelRoad }
        
        #expect(updatedInViewModel?.visited == true)
    }
    
    @Test("Toggle visited updates computed properties")
    func testToggleVisitedUpdatesProgress() {
        let testLocations = createTestLocations()
        let mockRepository = MockLocationRepository(locations: testLocations)
        let viewModel = ColorSetViewModel(repository: mockRepository)
        
        #expect(viewModel.completionProgress == 0.5)
        #expect(viewModel.totalVisitedLocations == 2)
        
        guard let whitechapelLocation = testLocations.first(where: { $0.id == .whitechapelRoad }) else {
            #expect(Bool(false), "Should find whitechapel location")
            return
        }
        
        viewModel.toggleVisited(for: whitechapelLocation)
        
        #expect(viewModel.completionProgress == 0.75)
        #expect(viewModel.totalVisitedLocations == 3)
    }
    
    @Test("Refresh locations syncs with repository")
    func testRefreshLocations() {
        let testLocations = createTestLocations()
        let mockRepository = MockLocationRepository(locations: testLocations)
        let viewModel = ColorSetViewModel(repository: mockRepository)
        
        #expect(viewModel.locations.count == 4)
        
        let newLocation = Location(
            id: .pallMall,
            name: "Pall Mall",
            colorSetId: .pink,
            image: "test",
            position: CLLocationCoordinate2D(latitude: 0, longitude: 0),
            storage: MockLocationStorage()
        )
        mockRepository.setLocations(testLocations + [newLocation])
        
        // Before refresh, viewModel doesn't know about the change
        #expect(viewModel.locations.count == 4)
        
        // After refresh, it should sync
        viewModel.refreshLocations()
        #expect(viewModel.locations.count == 5)
    }

}
