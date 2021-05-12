//
//  MovieDetailViewSpy.swift
//  Merqueo_testTests
//
//  Created by Carlos Pava on 11/05/21.
//

import Foundation
@testable import Merqueo_test
@testable import MerqueoCore
final class MovieDetailViewSpy: MovieDetailViewType {

    
    var showMovieDetailCallBack: (_ detail: MovieDetailContainerObject) -> Void = { _ in }

    func showMovieDetail(_ detail: MovieDetailContainerObject) {
        showMovieDetailCallBack(detail)
    }
}

final class MovieDetailCoordinatorDelegateSpy: MovieDetailCoordinatorDelegate {
    typealias Completion = () -> Void
    init() {}

    var showLoadingCallBack: Completion = {}
    var hideLoadingCallBack: Completion = {}
    var showErrorCallBack: Completion = {}
    var popViewCallBack: Completion = {}
    func popView() {
        popViewCallBack()
    }

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
}
