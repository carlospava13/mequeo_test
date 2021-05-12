//
//  GetMovieDetailInteractorStub.swift
//  Merqueo_testTests
//
//  Created by Carlos Pava on 11/05/21.
//
import Combine
@testable import MerqueoCore

class GetMovieDetailInteractorStub: BaseInteractorStub<MovieDetailCoreDto>, GetMovieDetailInteractorType {
    func getMovieDetail(id: Int) -> AnyPublisher<MovieDetailCoreDto, Error> {
        execute()
    }
}
