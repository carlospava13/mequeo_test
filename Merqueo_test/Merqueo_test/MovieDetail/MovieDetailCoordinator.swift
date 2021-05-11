//
//  MovieDetailCoordinator.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 10/05/21.
//

import Foundation

protocol MovieDetailCoordinatorDelegate: AnyObject {
    func popView()
}

final class MovieDetailCoordinator: BaseCoordinator {
    weak var movieDetailCoordinatorDelegate: MovieDetailCoordinatorDelegate?

    func start(id: Int) {
        let movieDetailViewController = MovieDetailViewController()
        let dependencies = MovieDetailPresenter.InputDependencies(coordinator: movieDetailCoordinatorDelegate, id: id)
        let presenter = MovieDetailPresenter(dependencies: dependencies)
        movieDetailViewController.presenter = presenter
        router.push(
            movieDetailViewController,
            transition: .none,
            animated: true,
            completion: nil)
    }
}
