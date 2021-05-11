//
//  HomeViewSpy.swift
//  Merqueo_testTests
//
//  Created by Carlos Pava on 9/05/21.
//

import Foundation
@testable import Merqueo_test

class HomeViewSpy: HomeViewType {
    init() {}

    var setMoviesCallBack: (_ movies: [MovieObjectView]) -> Void = { _ in }
    var endRefreshCallBack: () -> Void = {}
    func set(movies: [MovieObjectView]) {
        setMoviesCallBack(movies)
    }

    func endRefresh() {
        endRefreshCallBack()
    }
}

class HomeCoordinatorSpy: HomeCoordinatorDelegate {
    init() {}
    var showLoadingCallBack: () -> Void = {}
    var hideLoadingCallBack: () -> Void = {}
    var showErrorCallBack: () -> Void = {}
    var showMovieDetailCallBack: () -> Void = {}
    func showLoading() {
        showLoadingCallBack()
    }

    func hideLoading(completion: (() -> Void)?) {
        hideLoadingCallBack()
        completion?()
    }

    func showError(description: String) {
        showErrorCallBack()
    }
    
    func showMovieDetail(id: Int) {
        showMovieDetailCallBack()
    }
}
