//
//  BaseRepositoryStub.swift
//  MerqueoCoreTests
//
//  Created by Carlos Pava on 9/05/21.
//

import Combine
@testable import MerqueoCore
class BaseRepositoryStub<Params> {
    enum Result {
        case success(Params)
        case failure(Error)
    }
    var responseHandler: Result

    
    init() {
        responseHandler = .failure(CoreTestError.notFound)
    }
    
    func execute<T>() -> AnyPublisher<T, Error> {
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
