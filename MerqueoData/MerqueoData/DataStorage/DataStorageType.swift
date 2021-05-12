//
//  DataStorageType.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

public protocol DataStorageType {
    func set<T>(key: ValueStorage, data: T)
    func get<T>(key: ValueStorage) throws -> T
}

public enum ValueStorage: String {
    case token
}
