//
//  ApiClient.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation
import Combine

final class ApiClient: ApiClientType {
    func execute<T: Codable>(_ request: URLRequest, decodingType: T.Type) -> AnyPublisher<T, Error> {
        return  URLSession.shared.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw ApiError.responseUnsuccessful
                }
                
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
