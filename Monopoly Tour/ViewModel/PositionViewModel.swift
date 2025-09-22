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
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: location.position,
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        )
    }
    
    init(location: Location) {
        self.location = location
    }
    
    func openDirections() {
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: location.position))
        mapItem.name = location.name
        mapItem.openInMaps(launchOptions: [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking
        ])
    }
    
    func toggleVisited(for location: Location) {
        if let index = locations.firstIndex(where: { $0.id == location.id }) {
            locations[index].toggleVisit()
            LocationStorage.saveVisitedState(for: location.id, visited: locations[index].visited)
            objectWillChange.send()
        }
    }
}
