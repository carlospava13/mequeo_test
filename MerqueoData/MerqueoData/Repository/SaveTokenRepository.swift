//
//  SaveTokenRepository.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine

public final class SaveTokenRepository: SaveTokenRepositoryType {
    
    private let dataStorage: DataStorageType
    
    public init (dataStorage: DataStorageType) {
        self.dataStorage = dataStorage
    }
    
    public func saveToken(token: String) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { emitter in
            self.dataStorage.set(key: .token, data: token)
            emitter(.success(()))
        }.eraseToAnyPublisher()
    }
}
