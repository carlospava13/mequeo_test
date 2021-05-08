//
//  GetTokenRepositoryType.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation
import Combine

public protocol GetTokenRepositoryType: BaseRepositoryType {
    func request() -> AnyPublisher<TokenDto, Error>
}
