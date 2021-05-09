//
//  SaveTokenRepositoryType.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine

public protocol SaveTokenRepositoryType {
    func saveToken(token: String) -> AnyPublisher<Void, Error>
}
