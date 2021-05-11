//
//  GetMovieDetailInteractor.swift
//  MerqueoCore
//
//  Created by Carlos Pava on 11/05/21.
//

import Combine
import MerqueoData

public final class GetMovieDetailInteractor: GetMovieDetailInteractorType {
    
    private let repository: GetMovieDetailRepositoryType

    public init(repository: GetMovieDetailRepositoryType) {
        self.repository = repository
    }
    
    public func getMovieDetail(id: Int) -> AnyPublisher<MovieDetailCoreDto, Error> {
        repository.getMovieDetail(id: id).map { (movieDetailDto) -> MovieDetailCoreDto in
            MovieDetailCoreDto(backdropPath: movieDetailDto.backdropPath,
                               genres: movieDetailDto.genres.map({ (genresDto) -> GenresCoreDto in
                                GenresCoreDto(id: genresDto.id,
                                              name: genresDto.name)
                               }), originalTitle: movieDetailDto.originalTitle,
                               overview: movieDetailDto.overview,
                               posterPath: movieDetailDto.posterPath)
        }.eraseToAnyPublisher()
    }
    
    
}
