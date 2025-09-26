//
//  LocationStorageProtocol.swift
//  Monopoly Tour
//
//  Created by Kassim Mirza on 25/09/2025.
//

import Foundation

protocol LocationStorageProtocol {
    func saveVisitedState(for locationID: LocationID, visited: Bool)
    func getVisitedState(for locationID: LocationID, defaultValue: Bool) -> Bool
}
