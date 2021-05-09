//
//  GetPopularMovieRepository.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine

public protocol GetPopularMovieRepositoryType {
    func getMovies() -> AnyPublisher<MovieResult, Error>
}
