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
}
