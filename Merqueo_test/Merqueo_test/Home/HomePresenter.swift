//
//  HomePresenter.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation
import MerqueoCore

final class HomePresenter: BasePresenter {
    struct InputDependencies {
        weak var coordinator: HomeCoordinatorDelegate?
        let getMoviesInteractor: GetMoviesInteractorType
    }

    private var ownerView: HomeViewType! {
        view as? HomeViewType
    }

    private let dependencies: InputDependencies

    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }

    override func viewDidLoad() {
        getMovies()
    }

    private func getMovies() {
        dependencies.coordinator?.showLoading()
        dependencies.getMoviesInteractor.getMovies().sink { [weak self, weak ownerView] completion in
            ownerView?.endRefresh()
            switch completion {
            case .failure(let error):
                self?.dependencies.coordinator?.hideLoading(completion: {
                    self?.dependencies.coordinator?.showError(description: error.localizedDescription)
                })
            case .finished:
                self?.dependencies.coordinator?.hideLoading(completion: nil)
            }
            
        } receiveValue: { [weak self] movies in
            self?.parseToObjectView(movies: movies)
        }.store(in: &subscriptions)
    }

    private func parseToObjectView(movies: [MovieCoreDto]) {
        let movies = movies.map { (movieDto) -> MovieObjectView in
            MovieObjectView(
                title: movieDto.title,
                posterPath: movieDto.posterPath,
                id: movieDto.id)
        }
        ownerView.set(movies: movies)
    }
}

extension HomePresenter: HomePresenterType {
    func movieSelected(_ movie: MovieObjectView) {
        print(movie.id)
    }
    
    func refreshMovies() {
        getMovies()
    }
}
