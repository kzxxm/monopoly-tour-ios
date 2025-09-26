//
//  AppDependencies.swift
//  Monopoly Tour
//
//  Created by Kassim Mirza on 26/09/2025.
//

import Combine
import Foundation

class AppDependencies: ObservableObject {
    lazy var storage: LocationStorageProtocol = LocationStorage()
    lazy var repository: LocationRepositoryProtocol = LocationRepository(storage: storage)
    
    static let shared = AppDependencies()
    
    private init() {}
}
