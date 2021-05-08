//
//  ApiClientType.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine
import Foundation
protocol ApiClientType {
    func execute<T: Codable>(_ request: URLRequest,
                    decodingType: T.Type) -> AnyPublisher<T, Error> 
}
