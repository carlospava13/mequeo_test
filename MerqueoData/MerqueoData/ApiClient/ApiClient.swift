//
//  ApiClient.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine
import Foundation

public final class ApiClient: ApiClientType {
    public init() {}
    
    public func execute<T: Codable>(_ endPoint: EndPoint) -> AnyPublisher<T, Error> {
        guard let url = endPoint.url else {
            return Result.Publisher(ApiError.notFound).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: URLRequest(url: url))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw ApiError.responseUnsuccessful
                }

                return $0.data
            }
            .print()
            .receive(on: RunLoop.main)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
