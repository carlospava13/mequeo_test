//
//  GetMoviesInteractorType.swift
//  MerqueoCore
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation
import Combine
import MerqueoData
public protocol GetMoviesInteractorType {
    init(repository: GetPopularMovieRepositoryType)
    func getMovies() -> AnyPublisher<MovieResult, Error>
}
