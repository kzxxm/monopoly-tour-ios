//
//  LocationRepository.swift
//  Monopoly Tour
//
//  Created by Kassim Mirza on 26/09/2025.
//

import Foundation
import MapKit

class LocationRepository: LocationRepositoryProtocol {
    private var locations: [Location]
    private let storage: LocationStorageProtocol
    
    init(storage: LocationStorageProtocol) {
        self.storage = storage
        self.locations = Self.createDefaultLocations(storage: storage)
    }
    
    func getAllLocations() -> [Location] {
        return locations
    }
    
    func getLocation(by id: LocationID) -> Location? {
        return locations.first(where: { $0.id == id })
    }
    
    func updateLocation(_ location: Location) {
        if let index = locations.firstIndex(where: { $0.id == location.id }) {
            locations[index] = location
        }
    }
    
    func getLocations(for colorSetId: ColorSetId) -> [Location] {
        return locations.filter { $0.colorSetId == colorSetId }
    }
    
    private static func createDefaultLocations(storage: LocationStorageProtocol) -> [Location] {
        return [
            Location(id: .oldKentRoad, name: "Old Kent Road", colorSetId: .brown, image: "old-kent-road", position: CLLocationCoordinate2D(latitude: 51.4951, longitude: -0.0723), storage: storage),
            Location(id: .whitechapelRoad, name: "Whitechapel Road", colorSetId: .brown, image: "whitechapel-road", position: CLLocationCoordinate2D(latitude: 51.5194, longitude: -0.0597), storage: storage),
            
            Location(id: .theAngelIslington, name: "The Angel Islington", colorSetId: .lightBlue, image: "the-angel-islington", position: CLLocationCoordinate2D(latitude: 51.5326, longitude: -0.1054), storage: storage),
            Location(id: .eustonRoad, name: "Euston Road", colorSetId: .lightBlue, image: "euston-road", position: CLLocationCoordinate2D(latitude: 51.5281, longitude: -0.1339), storage: storage),
            Location(id: .pentonvilleRoad, name: "Pentonville Road", colorSetId: .lightBlue, image: "pentonville-road", position: CLLocationCoordinate2D(latitude: 51.5305, longitude: -0.1132), storage: storage),
            
            Location(id: .pallMall, name: "Pall Mall", colorSetId: .pink, image: "pall-mall", position: CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1296), storage: storage),
            Location(id: .whitehall, name: "Whitehall", colorSetId: .pink, image: "whitehall", position: CLLocationCoordinate2D(latitude: 51.5060, longitude: -0.1272), storage: storage),
            Location(id: .northumberlandAvenue, name: "Northumberland Avenue", colorSetId: .pink, image: "northumberland-avenue", position: CLLocationCoordinate2D(latitude: 51.5079, longitude: -0.1235), storage: storage),
            
            Location(id: .bowStreet, name: "Bow Street", colorSetId: .orange, image: "bow-street", position: CLLocationCoordinate2D(latitude: 51.5123, longitude: -0.1175), storage: storage),
            Location(id: .marlboroughStreet, name: "Marlborough Street", colorSetId: .orange, image: "marlborough-street", position: CLLocationCoordinate2D(latitude: 51.5112, longitude: -0.1198), storage: storage),
            Location(id: .vineStreet, name: "Vine Street", colorSetId: .orange, image: "vine-street", position: CLLocationCoordinate2D(latitude: 51.5100, longitude: -0.1205), storage: storage),
            
            Location(id: .strand, name: "Strand", colorSetId: .red, image: "strand", position: CLLocationCoordinate2D(latitude: 51.5101, longitude: -0.1168), storage: storage),
            Location(id: .fleetStreet, name: "Fleet Street", colorSetId: .red, image: "fleet-street", position: CLLocationCoordinate2D(latitude: 51.5145, longitude: -0.1110), storage: storage),
            Location(id: .trafalgarSquare, name: "Trafalgar Square", colorSetId: .red, image: "trafalgar-square", position: CLLocationCoordinate2D(latitude: 51.5080, longitude: -0.1281), storage: storage),
            
            Location(id: .leicesterSquare, name: "Leicester Square", colorSetId: .yellow, image: "leicester-square", position: CLLocationCoordinate2D(latitude: 51.5100, longitude: -0.1300), storage: storage),
            Location(id: .coventryStreet, name: "Coventry Street", colorSetId: .yellow, image: "coventry-street", position: CLLocationCoordinate2D(latitude: 51.5098, longitude: -0.1320), storage: storage),
            Location(id: .picadilly, name: "Piccadilly", colorSetId: .yellow, image: "picadilly", position: CLLocationCoordinate2D(latitude: 51.5101, longitude: -0.1337), storage: storage),
            
            Location(id: .regentStreet, name: "Regent Street", colorSetId: .green, image: "regent-street", position: CLLocationCoordinate2D(latitude: 51.5125, longitude: -0.1381), storage: storage),
            Location(id: .oxfordStreet, name: "Oxford Street", colorSetId: .green, image: "oxford-street", position: CLLocationCoordinate2D(latitude: 51.5154, longitude: -0.1410), storage: storage),
            Location(id: .bondStreet, name: "Bond Street", colorSetId: .green, image: "bond-street", position: CLLocationCoordinate2D(latitude: 51.5142, longitude: -0.1496), storage: storage),
            
            Location(id: .parkLane, name: "Park Lane", colorSetId: .blue, image: "park-lane", position: CLLocationCoordinate2D(latitude: 51.5079, longitude: -0.1586), storage: storage),
            Location(id: .mayfair, name: "Mayfair", colorSetId: .blue, image: "mayfair", position: CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1440), storage: storage),
            
            Location(id: .fenchurchStreet, name: "Fenchurch Street", colorSetId: .stations, image: "fenchurch-street", position: CLLocationCoordinate2D(latitude: 51.5116, longitude: -0.0804), storage: storage),
            Location(id: .liverpoolStreet, name: "Liverpool Street", colorSetId: .stations, image: "liverpool-street", position: CLLocationCoordinate2D(latitude: 51.5176, longitude: -0.0826), storage: storage),
            Location(id: .marylebone, name: "Marylebone", colorSetId: .stations, image: "marylebone", position: CLLocationCoordinate2D(latitude: 51.5225, longitude: -0.1636), storage: storage),
            Location(id: .kingsCross, name: "King's Cross", colorSetId: .stations, image: "kings-cross", position: CLLocationCoordinate2D(latitude: 51.5308, longitude: -0.1238), storage: storage),
            
            Location(id: .towerOfLondon, name: "Tower of London", colorSetId: .jail, image: "tower-of-london", position: CLLocationCoordinate2D(latitude: 51.5081, longitude: -0.0759), storage: storage)
        ]
    }
}
