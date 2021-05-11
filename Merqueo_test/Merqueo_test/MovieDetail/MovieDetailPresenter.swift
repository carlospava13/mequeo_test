//
//  MovieDetailPresenter.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 10/05/21.
//

import Foundation

final class MovieDetailPresenter: BasePresenter {
    struct InputDependencies {
        weak var coordinator: MovieDetailCoordinatorDelegate?
        let id: Int
    }

    private let dependencies: InputDependencies
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }
    
    override func viewDidDisappear() {
        dependencies.coordinator?.popView()
    }
}

extension MovieDetailPresenter: MovieDetailPresenterType {
    
}
