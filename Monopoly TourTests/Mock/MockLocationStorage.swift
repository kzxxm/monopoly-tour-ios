//
//  MockLocationStorage.swift
//  Monopoly Tour Tests
//
//  Created by Kassim Mirza on 25/09/2025.
//

import Foundation
@testable import Monopoly_Tour

class MockLocationStorage: LocationStorageProtocol {
    private var storage: [String: Bool] = [:]
    
    func saveVisitedState(for locationID: LocationID, visited: Bool) {
        storage[locationID.rawValue] = visited
    }
    
    func getVisitedState(for locationID: Monopoly_Tour.LocationID, defaultValue: Bool) -> Bool {
        return storage[locationID.rawValue] ?? defaultValue
    }
    
    // Helper methods for testing
    func clear() {
        storage.removeAll()
    }
    
    func getAllStoredStates() -> [String: Bool] {
        return storage
    }
}
