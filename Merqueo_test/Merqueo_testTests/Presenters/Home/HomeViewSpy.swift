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

    func set(movies: [MovieObjectView]) {
        setMoviesCallBack(movies)
    }
}

class HomeCoordinatorSpy: HomeCoordinatorDelegate {
    init() {}
    var showLoadingCallBack: () -> Void = {}
    var hideLoadingCallBack: () -> Void = {}

    func showLoading() {
        showLoadingCallBack()
    }

    func hideLoading() {
        hideLoadingCallBack()
    }
}
