//
//  GetMovieDetailRepositoryType.swift
//  MerqueoData
//
//  Created by Carlos Pava on 11/05/21.
//

import Combine

public protocol GetMovieDetailRepositoryType {
    func getMovieDetail(id: Int) -> AnyPublisher<MovieDetailDto, Error>
}
