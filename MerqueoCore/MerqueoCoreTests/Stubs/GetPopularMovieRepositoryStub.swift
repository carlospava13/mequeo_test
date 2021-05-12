//
//  GetPopularMovieRepositoryStub.swift
//  MerqueoCoreTests
//
//  Created by Carlos Pava on 9/05/21.
//

import Foundation
import Combine
@testable import MerqueoData
final class GetPopularMovieRepositoryStub: BaseRepositoryStub<MovieResult>,GetPopularMovieRepositoryType {
    func getMovies() -> AnyPublisher<MovieResult, Error> {
        execute()
    }
}
