//
//  GetMovieDetailInteractorType.swift
//  MerqueoCore
//
//  Created by Carlos Pava on 11/05/21.
//

import Combine
import Foundation
import MerqueoData

public protocol GetMovieDetailInteractorType {
    func getMovieDetail(id: Int) -> AnyPublisher<MovieDetailCoreDto, Error>
}
