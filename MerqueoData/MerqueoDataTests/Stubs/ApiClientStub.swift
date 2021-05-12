//
//  ApiClientStub.swift
//  MerqueoDataTests
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine
import Foundation
@testable import MerqueoData
final class ApiClientStub<Params: Codable>: ApiClientType {
    
    enum Result {
        case success(Params)
        case failure(Error)
    }

    var responseHandler: Result

    init() {
        responseHandler = .failure(TestError.notFound)
    }

    func execute<T>(_: EndPoint) -> AnyPublisher<T, Error> where T: Decodable, T: Encodable {
        Future<T,Error> { emitter in
            switch self.responseHandler {
            case .success(let params):
                emitter(.success(params as! T))
            case .failure(let error):
                emitter(.failure(error))
            }
        }.eraseToAnyPublisher()
    }
}
