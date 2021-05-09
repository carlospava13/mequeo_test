//
//  GetPopularMovieRepository.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//
import Foundation
import Combine

public final class GetPopularMovieRepository: BaseRepository, GetPopularMovieRepositoryType {
    public func getMovies() -> AnyPublisher<MovieResult, Error> {
        service.execute(EndPoint(path: "movie/popular?api_key=\(settings.apiKey)&language=en-US&page=1"))
    }
}
