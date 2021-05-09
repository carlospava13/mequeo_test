//
//  MovieDto.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

public struct MovieResult: Codable {
    public let page: Int
    public let results: [MovieDto]
    public let totalPages: Int
    public let totalResults: Int
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

public struct MovieDto: Codable {
    public let adult: Bool
    public let backdropPath: String
    public let genreIds: [Int]
    public let id: Int
    public let originalLanguage: String
    public let originalTitle: String
    public let overview: String
    public let popularity: Double
    public let posterPath: String
    public let releaseDate: String
    public let title: String
    public let video: Bool
    public let voteAverage: Double
    public let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case video = "video"
        case title = "title"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
