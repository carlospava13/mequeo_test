//
//  MovieDetailDto.swift
//  MerqueoData
//
//  Created by Carlos Pava on 11/05/21.
//

import Foundation

public struct MovieDetailDto: Codable {
    public let adult: Bool
    public let backdropPath: String
    public let genres: [GenresDto]
    public let originalTitle: String
    public let overview: String
    public let posterPath: String
    public let productionCompanies: [ProductionCompaniesDto]
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genres = "genres"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
    }
}

public struct GenresDto: Codable {
    public let id: Int
    public let name: String
}

public struct ProductionCompaniesDto: Codable {
    public let id: Int
    public let logoPath: String
    public let name: String
    public let originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case logoPath = "logo_path"
        case name = "name"
        case originCountry = "origin_country"
    }
}
