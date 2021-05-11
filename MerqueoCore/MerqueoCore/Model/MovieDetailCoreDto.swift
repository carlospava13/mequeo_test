//
//  MovieDetailCoreDto.swift
//  MerqueoCore
//
//  Created by Carlos Pava on 11/05/21.
//

public struct MovieDetailCoreDto {
    public let backdropPath: String
    public let genres: [GenresCoreDto]
    public let originalTitle: String
    public let overview: String
    public let posterPath: String
}

public struct GenresCoreDto {
    public let id: Int
    public let name: String
}
