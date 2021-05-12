//
//  MovieDetailCoordinator.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 10/05/21.
//

import MerqueoCore
import MerqueoData

protocol MovieDetailCoordinatorDelegate: BaseCoordinatorType {
    func popView()
}

final class MovieDetailCoordinator: BaseCoordinator {
    weak var movieDetailCoordinatorDelegate: MovieDetailCoordinatorDelegate?

    func start(id: Int) {
        let movieDetailViewController = MovieDetailViewController()
        let apiClient = ApiClient()
        let repository = GetMovieDetailRepository(service: apiClient)
        let getMovieDetailInteractor = GetMovieDetailInteractor(repository: repository)
        let dependencies = MovieDetailPresenter.InputDependencies(coordinator: movieDetailCoordinatorDelegate, id: id, getMovieDetailInteractor: getMovieDetailInteractor)
        let presenter = MovieDetailPresenter(dependencies: dependencies)
        movieDetailViewController.presenter = presenter
        router.push(
            movieDetailViewController,
            transition: .none,
            animated: true,
            completion: nil)
    }
}
