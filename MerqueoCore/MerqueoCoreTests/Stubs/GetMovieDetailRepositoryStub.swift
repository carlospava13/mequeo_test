//
//  GetMovieDetailRepositoryStub.swift
//  MerqueoCoreTests
//
//  Created by Carlos Pava on 11/05/21.
//

import Foundation
import Combine
@testable import MerqueoData
final class GetMovieDetailRepositoryStub: BaseRepositoryStub<MovieDetailDto>,GetMovieDetailRepositoryType {
    func getMovieDetail(id: Int) -> AnyPublisher<MovieDetailDto, Error> {
        execute()
    }
}

