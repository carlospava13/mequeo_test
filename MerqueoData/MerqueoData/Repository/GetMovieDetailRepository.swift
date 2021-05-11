//
//  GetMovieDetailRepository.swift
//  MerqueoData
//
//  Created by Carlos Pava on 11/05/21.
//

import Combine

public final class GetMovieDetailRepository: BaseRepository, GetMovieDetailRepositoryType {
    public func getMovieDetail(id: Int) -> AnyPublisher<MovieDetailDto, Error> {
        service.execute(EndPoint(path: "movie/\(id)?api_key=\(settings.apiKey)"))
    }
}

