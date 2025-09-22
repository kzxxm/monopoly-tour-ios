//
//  LocationStorage.swift
//  Monopoly Tour
//
//  Created by Mirza, Kassim Zamaan (K. Z.) on 17/09/2025.
//

import Foundation

class LocationStorage {
    static func saveVisitedState(for locationID: LocationID, visited: Bool) {
        UserDefaults.standard.set(visited, forKey: locationID.rawValue)
    }
    
    static func getVisitedState(for locationID: LocationID, defaultValue: Bool = false) -> Bool {
        if UserDefaults.standard.object(forKey: locationID.rawValue) == nil {
            return defaultValue
        }
        return UserDefaults.standard.bool(forKey: locationID.rawValue)
    }
}
