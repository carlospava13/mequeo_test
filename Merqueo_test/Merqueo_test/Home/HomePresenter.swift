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
        dependencies.getMoviesInteractor.getMovies().sink { completion in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
                print("Finished")
            }
        } receiveValue: { [weak self] movies in
            self?.parseToObjectView(movies: movies)
        }.store(in: &subscriptions)
    }

    private func parseToObjectView(movies: [MovieCoreDto]) {
        let movies = movies.map { (movieDto) -> MovieObjectView in
            MovieObjectView(title: movieDto.title)
        }
        ownerView.set(movies: movies)
    }
}

extension HomePresenter: HomePresenterType {}
