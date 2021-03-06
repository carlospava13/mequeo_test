//
//  HomeCoordinator.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation
import MerqueoCore
import MerqueoData

protocol HomeCoordinatorDelegate: BaseCoordinatorType {
    func showMovieDetail(id: Int)
}

final class HomeCoordinator: BaseCoordinator {
    private var movieDetailCoordinator: MovieDetailCoordinator?

    override func start() {
        let homeViewController = HomeViewController()
        let apiClient = ApiClient()
        let getMovieRepository = GetPopularMovieRepository(service: apiClient)
        let getMovieInteractor = GetMoviesInteractor(repository: getMovieRepository)
        let dependencies = HomePresenter.InputDependencies(coordinator: self, getMoviesInteractor: getMovieInteractor)
        homeViewController.presenter = HomePresenter(dependencies: dependencies)
        router.setRootModule(
            homeViewController,
            animated: false)
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func showMovieDetail(id: Int) {
        movieDetailCoordinator = MovieDetailCoordinator(router: router)
        movieDetailCoordinator?.movieDetailCoordinatorDelegate = self
        movieDetailCoordinator?.start(id: id)
    }
}

extension HomeCoordinator: MovieDetailCoordinatorDelegate {
    func popView() {
        movieDetailCoordinator = nil
    }
}
