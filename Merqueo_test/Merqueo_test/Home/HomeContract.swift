//
//  HomeContract.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

protocol HomePresenterType: BasePresenterType {
    func refreshMovies()
}

protocol HomeViewType: BaseViewType {
    func set(movies: [MovieObjectView])
    func endRefresh()
}
