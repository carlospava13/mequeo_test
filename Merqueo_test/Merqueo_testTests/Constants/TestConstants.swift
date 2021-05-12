//
//  TestConstants.swift
//  Merqueo_testTests
//
//  Created by Carlos Pava on 9/05/21.
//

import Foundation
@testable import MerqueoCore
struct TestConstants {
    enum Movie {
        static let movieObjectViews: [MovieCoreDto] = [
            MovieCoreDto(
                title: "Godzilla vs. Kong",
                posterPath: "/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg",
                id: 123),
            MovieCoreDto(
                title: "Nobody",
                posterPath: "/oBgWY00bEFeZ9N25wWVyuQddbAo.jpg",
                id: 124)
        ]
    }
    
    enum MovieDetail {
        static let movieDetail = MovieDetailCoreDto(backdropPath: "/9yBVqNruk6Ykrwc32qrK2TIE5xw.jpg",
                                                    genres: [GenresCoreDto(id: 28,
                                                                           name: "Action"),
                                                             GenresCoreDto(id: 14,
                                                                                    name: "Fantasy")
                                                    ],
                                                    originalTitle: "Mortal Kombat",
                                                    overview: "Washed-up MMA fighter Cole Young, unaware of his heritage, and hunted by Emperor Shang Tsung's best warrior, Sub-Zero, seeks out and trains with Earth's greatest champions as he prepares to stand against the enemies of Outworld in a high stakes battle for the universe.",
                                                    posterPath: "/xGuOF1T3WmPsAcQEQJfnG7Ud9f8.jpg", productionCompanies: [])
    }
}
