//
//  DataStorage.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

public final class DataStorage: DataStorageType {
    private let defaults = UserDefaults.standard

    public init() {}
    
    public func set<T>(key: ValueStorage, data: T) {
        defaults.setValue(data, forKey: key.rawValue)
    }

    public func get<T>(key: ValueStorage) throws -> T {
        guard let data = defaults.value(forKey: key.rawValue) as? T else {
            throw DataStorageError.notFound
        }
        return data
    }
}

enum DataStorageError: Error {
    case notFound
}
