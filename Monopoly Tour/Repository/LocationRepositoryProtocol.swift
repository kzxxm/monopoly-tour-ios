//
//  LocationRepositoryProtocol.swift
//  Monopoly Tour
//
//  Created by Kassim Mirza on 26/09/2025.
//

import Foundation

protocol LocationRepositoryProtocol {
    func getAllLocations() -> [Location]
    func getLocation(by id: LocationID) -> Location?
    func updateLocation(_ location: Location)
    func getLocations(for colorSetId: ColorSetId) -> [Location]
}
