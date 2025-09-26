//
//  PositionViewModelTests.swift
//  Monopoly Tour Tests
//
//  Created by Kassim Mirza on 26/09/2025.
//

import Combine
import MapKit
import Testing
@testable import Monopoly_Tour

@Suite("PositionViewModel Tests")
struct PositionViewModelTests {
    func createTestLocation(visited: Bool = false) -> Location {
        let mockStorage = MockLocationStorage()
        return Location(
            id: .oldKentRoad,
            name: "Old Kent Road",
            colorSetId: .brown,
            image: "old-kent-road",
            position: CLLocationCoordinate2D(latitude: 51.4951, longitude: -0.0723),
            visited: visited,
            storage: mockStorage
        )
    }
    
    @Test("ViewModel initialization")
    func testInitialization() {
        let testLocation = createTestLocation()
        let mockRepository = MockLocationRepository()
        let viewModel = PositionViewModel(location: testLocation, repository: mockRepository)
        
        #expect(viewModel.location.id == .oldKentRoad)
        #expect(viewModel.location.name == "Old Kent Road")
        #expect(viewModel.location.visited == false)
    }
    
    @Test("Region computation from location position")
    func testRegionComputation() {
        let testLocation = createTestLocation()
        let mockRepository = MockLocationRepository()
        let viewModel = PositionViewModel(location: testLocation, repository: mockRepository)
        
        let region = viewModel.region
        
        #expect(region.center.latitude == 51.4951)
        #expect(region.center.longitude == -0.0723)
        #expect(region.span.latitudeDelta == 0.01)
        #expect(region.span.longitudeDelta == 0.01)
    }
    
    @Test("Toggle visited changes location and updates repository")
    func testToggleVisited() {
        let testLocation = createTestLocation(visited: false)
        let mockRepository = MockLocationRepository(locations: [testLocation])
        let viewModel = PositionViewModel(location: testLocation, repository: mockRepository)
        
        #expect(viewModel.location.visited == false)
        
        viewModel.toggleVisited()
        
        #expect(viewModel.location.visited == true)
        
        let updatedFromRepo = mockRepository.getLocation(by: .oldKentRoad)
        #expect(updatedFromRepo?.visited == true)
    }
    
    @Test("Toggle visited twice returns to original state")
    func testToggleVisitedTwice() {
        let testLocation = createTestLocation(visited: false)
        let mockRepository = MockLocationRepository(locations: [testLocation])
        let viewModel = PositionViewModel(location: testLocation, repository: mockRepository)
        
        let originalState = viewModel.location.visited
        
        viewModel.toggleVisited()
        viewModel.toggleVisited()
        
        #expect(viewModel.location.visited == originalState)
        
        let updatedFromRepo = mockRepository.getLocation(by: .oldKentRoad)
        #expect(updatedFromRepo?.visited == originalState)
    }
    
    @Test("ViewModel works with pre-visited location")
    func testViewModelWithVisitedLocation() {
        let testLocation = createTestLocation(visited: true)
        let mockRepository = MockLocationRepository(locations: [testLocation])
        let viewModel = PositionViewModel(location: testLocation, repository: mockRepository)
        
        #expect(viewModel.location.visited == true)
        
        viewModel.toggleVisited()
        #expect(viewModel.location.visited == false)
    }
}
