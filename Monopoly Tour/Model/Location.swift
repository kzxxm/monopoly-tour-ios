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
    
    private let storage: LocationStorageProtocol
    
    init(
        id: LocationID,
        name: String,
        colorSetId: ColorSetId,
        image: String,
        position: CLLocationCoordinate2D,
        visited: Bool = false,
        storage: LocationStorageProtocol = LocationStorage()
    ) {
        self.id = id
        self.name = name
        self.colorSetId = colorSetId
        self.image = image
        self.position = position
        self.storage = storage
        self.visited = storage.getVisitedState(for: id, defaultValue: visited)
    }
        
    func toggleVisit() {
        self.visited.toggle()
        storage.saveVisitedState(for: id, visited: visited)
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
