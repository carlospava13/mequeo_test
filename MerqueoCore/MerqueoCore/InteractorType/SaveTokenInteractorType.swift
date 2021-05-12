//
//  SaveTokenInteractorType.swift
//  MerqueoCore
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine
import MerqueoData
public protocol SaveTokenInteractorType {
    init(getTokenRepository: GetTokenRepositoryType,
         saveTokenRepository: SaveTokenRepositoryType)
    func saveToken() -> AnyPublisher<Void, Error>
}
