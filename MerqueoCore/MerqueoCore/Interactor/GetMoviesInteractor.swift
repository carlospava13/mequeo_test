//
//  GetMoviesInteractor.swift
//  MerqueoCore
//
//  Created by Carlos Pava on 8/05/21.
//

import Combine
import MerqueoData

public final class GetMoviesInteractor: GetMoviesInteractorType {
    private let repository: GetPopularMovieRepositoryType

    public init(repository: GetPopularMovieRepositoryType) {
        self.repository = repository
    }

    public func getMovies() -> AnyPublisher<[MovieCoreDto], Error> {
        repository.getMovies().map { (result) -> [MovieCoreDto] in
            result.results.map { (movieDto) -> MovieCoreDto in
                MovieCoreDto(title: movieDto.title,
                             posterPath: movieDto.posterPath)
            }
        }.eraseToAnyPublisher()
    }
}
