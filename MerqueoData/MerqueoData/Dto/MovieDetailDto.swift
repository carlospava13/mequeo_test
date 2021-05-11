//
//  MovieDetailDto.swift
//  MerqueoData
//
//  Created by Carlos Pava on 11/05/21.
//

import Foundation

public struct MovieDetailDto: Codable {
    public let backdropPath: String
    public let genres: [GenresDto]
    public let originalTitle: String
    public let overview: String
    public let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case genres = "genres"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
    }
}

public struct GenresDto: Codable {
    public let id: Int
    public let name: String
}
