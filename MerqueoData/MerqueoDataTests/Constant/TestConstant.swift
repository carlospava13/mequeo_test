//
//  TestConstant.swift
//  MerqueoDataTests
//
//  Created by Carlos Pava on 11/05/21.
//

import Foundation
@testable import MerqueoData
struct TestConstant {
    struct Movie {
        static let popularMovies: MovieResult = MovieResult(page: 1,
                                                            results: [
                                                                MovieDto(adult: false,
                                                                         backdropPath: "/9yBVqNruk6Ykrwc32qrK2TIE5xw.jpg",
                                                                         genreIds: [
                                                                            28,
                                                                            14,
                                                                            12,
                                                                            878
                                                                        ],
                                                                         id: 460465,
                                                                         originalLanguage: "en",
                                                                         originalTitle: "Mortal Kombat",
                                                                         overview: "Washed-up MMA fighter Cole Young, unaware of his heritage, and hunted by Emperor Shang Tsung's best warrior, Sub-Zero, seeks out and trains with Earth's greatest champions as he prepares to stand against the enemies of Outworld in a high stakes battle for the universe.",
                                                                         popularity: 5419.678,
                                                                         posterPath: "/6Wdl9N6dL0Hi0T1qJLWSz6gMLbd.jpg",
                                                                         releaseDate: "2021-04-07",
                                                                         title: "Mortal Kombat",
                                                                         video: false,
                                                                         voteAverage: 7.7,
                                                                         voteCount: 2229)
                                                            ],
                                                            totalPages: 500,
                                                            totalResults: 10000)
        
        static let movieDetail: MovieDetailDto = MovieDetailDto(adult: false,
                                                                backdropPath: "/pcDc2WJAYGJTTvRSEIpRZwM3Ola.jpg",
                                                                genres: [
                                                                 GenresDto(id: 28,
                                                                           name: "Action")
                                                                ],
                                                                originalTitle: "Zack Snyder's Justice League",
                                                                overview: "Determined to ensure Superman's ultimate sacrifice was not in vain, Bruce Wayne aligns forces with Diana Prince with plans to recruit a team of metahumans to protect the world from an approaching threat of catastrophic proportions.",
                                                                posterPath: "/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg",
                                                                productionCompanies: [
                                                                    ProductionCompaniesDto(id: 174,
                                                                                           logoPath: "/IuAlhI9eVC9Z8UQWOIDdWRKSEJ.png",
                                                                                           name: "Warner Bros. Pictures",
                                                                                           originCountry: "US")
                                                                ])
    }
}
