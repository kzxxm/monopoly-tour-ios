//
//  Location.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 13/09/2025.
//

import Combine
import MapKit
import SwiftUI

class Location: ObservableObject, Identifiable {
    let id: LocationID
    let name: String
    let colorSetId: ColorSetId
    let image: String
    let position: CLLocationCoordinate2D
    @Published var visited: Bool
    
    init(id: LocationID, name: String, colorSetId: ColorSetId, image: String, position: CLLocationCoordinate2D, visited: Bool = false) {
        self.id = id
        self.name = name
        self.colorSetId = colorSetId
        self.image = image
        self.position = position
        self.visited = LocationStorage.getVisitedState(for: id, defaultValue: visited)
    }
        
    func toggleVisit() {
        self.visited.toggle()
    }
}

enum LocationID: String, CaseIterable {
    case oldKentRoad
    case whitechapelRoad
    case theAngelIslington
    case eustonRoad
    case pentonvilleRoad
    case pallMall
    case whitehall
    case northumberlandAvenue
    case bowStreet
    case marlboroughStreet
    case vineStreet
    case strand
    case fleetStreet
    case trafalgarSquare
    case leicesterSquare
    case coventryStreet
    case picadilly
    case regentStreet
    case oxfordStreet
    case bondStreet
    case parkLane
    case mayfair
    case fenchurchStreet
    case liverpoolStreet
    case marylebone
    case kingsCross
    case towerOfLondon
}

var locations: [Location] = [
    Location(id: .oldKentRoad, name: "Old Kent Road", colorSetId: .brown, image: "old-kent-road", position: CLLocationCoordinate2D(latitude: 51.4951, longitude: -0.0723)),
    Location(id: .whitechapelRoad, name: "Whitechapel Road", colorSetId: .brown, image: "whitechapel-road", position: CLLocationCoordinate2D(latitude: 51.5194, longitude: -0.0597)),
    
    Location(id: .theAngelIslington, name: "The Angel Islington", colorSetId: .lightBlue, image: "the-angel-islington", position: CLLocationCoordinate2D(latitude: 51.5326, longitude: -0.1054)),
    Location(id: .eustonRoad, name: "Euston Road", colorSetId: .lightBlue, image: "euston-road", position: CLLocationCoordinate2D(latitude: 51.5281, longitude: -0.1339)),
    Location(id: .pentonvilleRoad, name: "Pentonville Road", colorSetId: .lightBlue, image: "pentonville-road", position: CLLocationCoordinate2D(latitude: 51.5305, longitude: -0.1132)),
    
    Location(id: .pallMall, name: "Pall Mall", colorSetId: .pink, image: "pall-mall", position: CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1296)),
    Location(id: .whitehall, name: "Whitehall", colorSetId: .pink, image: "whitehall", position: CLLocationCoordinate2D(latitude: 51.5060, longitude: -0.1272)),
    Location(id: .northumberlandAvenue, name: "Northumberland Avenue", colorSetId: .pink, image: "northumberland-avenue", position: CLLocationCoordinate2D(latitude: 51.5079, longitude: -0.1235)),
    
    Location(id: .bowStreet, name: "Bow Street", colorSetId: .orange, image: "bow-street", position: CLLocationCoordinate2D(latitude: 51.5123, longitude: -0.1175)),
    Location(id: .marlboroughStreet, name: "Marlborough Street", colorSetId: .orange, image: "marlborough-street", position: CLLocationCoordinate2D(latitude: 51.5112, longitude: -0.1198)),
    Location(id: .vineStreet, name: "Vine Street", colorSetId: .orange, image: "vine-street", position: CLLocationCoordinate2D(latitude: 51.5100, longitude: -0.1205)),
    
    Location(id: .strand, name: "Strand", colorSetId: .red, image: "strand", position: CLLocationCoordinate2D(latitude: 51.5101, longitude: -0.1168)),
    Location(id: .fleetStreet, name: "Fleet Street", colorSetId: .red, image: "fleet-street", position: CLLocationCoordinate2D(latitude: 51.5145, longitude: -0.1110)),
    Location(id: .trafalgarSquare, name: "Trafalgar Square", colorSetId: .red, image: "trafalgar-square", position: CLLocationCoordinate2D(latitude: 51.5080, longitude: -0.1281)),
    
    Location(id: .leicesterSquare, name: "Leicester Square", colorSetId: .yellow, image: "leicester-square", position: CLLocationCoordinate2D(latitude: 51.5100, longitude: -0.1300)),
    Location(id: .coventryStreet, name: "Coventry Street", colorSetId: .yellow, image: "coventry-street", position: CLLocationCoordinate2D(latitude: 51.5098, longitude: -0.1320)),
    Location(id: .picadilly, name: "Piccadilly", colorSetId: .yellow, image: "picadilly", position: CLLocationCoordinate2D(latitude: 51.5101, longitude: -0.1337)),
    
    Location(id: .regentStreet, name: "Regent Street", colorSetId: .green, image: "regent-street", position: CLLocationCoordinate2D(latitude: 51.5125, longitude: -0.1381)),
    Location(id: .oxfordStreet, name: "Oxford Street", colorSetId: .green, image: "oxford-street", position: CLLocationCoordinate2D(latitude: 51.5154, longitude: -0.1410)),
    Location(id: .bondStreet, name: "Bond Street", colorSetId: .green, image: "bond-street", position: CLLocationCoordinate2D(latitude: 51.5142, longitude: -0.1496)),
    
    Location(id: .parkLane, name: "Park Lane", colorSetId: .blue, image: "park-lane", position: CLLocationCoordinate2D(latitude: 51.5079, longitude: -0.1586)),
    Location(id: .mayfair, name: "Mayfair", colorSetId: .blue, image: "mayfair", position: CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1440)),
    
    Location(id: .fenchurchStreet, name: "Fenchurch Street", colorSetId: .stations, image: "fenchurch-street", position: CLLocationCoordinate2D(latitude: 51.5116, longitude: -0.0804)),
    Location(id: .liverpoolStreet, name: "Liverpool Street", colorSetId: .stations, image: "liverpool-street", position: CLLocationCoordinate2D(latitude: 51.5176, longitude: -0.0826)),
    Location(id: .marylebone, name: "Marylebone", colorSetId: .stations, image: "marylebone", position: CLLocationCoordinate2D(latitude: 51.5225, longitude: -0.1636)),
    Location(id: .kingsCross, name: "King's Cross", colorSetId: .stations, image: "kings-cross", position: CLLocationCoordinate2D(latitude: 51.5308, longitude: -0.1238)),
    
    Location(id: .towerOfLondon, name: "Tower of London", colorSetId: .jail, image: "tower-of-london", position: CLLocationCoordinate2D(latitude: 51.5081, longitude: -0.0759))
]
