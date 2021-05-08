//
//  GetTokenRepository.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation
import Combine

public final class GetTokenRepository:BaseRepository, GetTokenRepositoryType {    
    public func request() -> AnyPublisher<TokenDto, Error> {
        service.execute(EndPoint(path: "authentication/token/new?api_key=\(settings.apiKey)"))
    }
}
