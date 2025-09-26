//
//  PositionViewModel.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 19/09/2025.
//

import Combine
import MapKit

class PositionViewModel: ObservableObject {
    @Published var location: Location
    private let repository: LocationRepositoryProtocol
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: location.position,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
    
    init(location: Location, repository: LocationRepositoryProtocol = LocationRepository(storage: LocationStorage())) {
        self.location = location
        self.repository = repository
    }
    
    func openDirections() {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: location.position))
        mapItem.name = location.name
        mapItem.openInMaps(launchOptions: [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking
        ])
    }
    
    func toggleVisited() {
        location.toggleVisit()
        repository.updateLocation(location)
        objectWillChange.send()
    }
}
