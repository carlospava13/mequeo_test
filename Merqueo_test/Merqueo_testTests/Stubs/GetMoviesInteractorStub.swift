//
//  GetMoviesInteractorStub.swift
//  Merqueo_testTests
//
//  Created by Carlos Pava on 9/05/21.
//

import Combine
@testable import MerqueoCore

class GetMoviesInteractorStub: BaseInteractorStub<[MovieCoreDto]>, GetMoviesInteractorType {
    func getMovies() -> AnyPublisher<[MovieCoreDto], Error> {
        execute()
    }
}
