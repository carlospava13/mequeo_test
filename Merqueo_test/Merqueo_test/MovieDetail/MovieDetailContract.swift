//
//  MovieDetailContract.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 10/05/21.
//

import MerqueoCore

protocol MovieDetailPresenterType: BasePresenterType {}

protocol MovieDetailViewType: BaseViewType {
    func showMovieDetail(_ detail: MovieDetailCoreDto)
}
