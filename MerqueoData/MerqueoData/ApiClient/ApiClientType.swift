//
//  ApiClientType.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine
import Foundation
public protocol ApiClientType {
    func execute<T: Codable>(_ endPoint: EndPoint) -> AnyPublisher<T, Error> 
}
