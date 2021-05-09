//
//  SaveTokenInteractor.swift
//  MerqueoCore
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine
import MerqueoData

public final class SaveTokenInteractor: SaveTokenInteractorType {
    private var getTokenRepository: GetTokenRepositoryType
    private var saveTokenRepository: SaveTokenRepositoryType

    public init(getTokenRepository: GetTokenRepositoryType, saveTokenRepository: SaveTokenRepositoryType) {
        self.getTokenRepository = getTokenRepository
        self.saveTokenRepository = saveTokenRepository
    }

    public func saveToken() -> AnyPublisher<Void, Error> {
        getTokenRepository.request().map { (token) -> String in
            token.requestToken
        }.print().flatMap { token in
            self.saveTokenRepository.saveToken(token: token)
        }.eraseToAnyPublisher()
    }
}
