//
//  MovieDetailPresenter.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 10/05/21.
//

import Combine
import MerqueoCore

final class MovieDetailPresenter: BasePresenter {
    struct InputDependencies {
        weak var coordinator: MovieDetailCoordinatorDelegate?
        let id: Int
        let getMovieDetailInteractor: GetMovieDetailInteractorType
    }

    private let dependencies: InputDependencies

    private var ownerView: MovieDetailViewType! {
        view as? MovieDetailViewType
    }

    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }

    override func viewDidLoad() {
        getMovieDetail()
    }

    override func viewDidDisappear() {
        dependencies.coordinator?.popView()
    }

    private func getMovieDetail() {
        dependencies.coordinator?.showLoading()
        let id = dependencies.id
        dependencies.getMovieDetailInteractor.getMovieDetail(id: id).sink { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.dependencies.coordinator?.hideLoading(completion: {
                    self?.dependencies.coordinator?.showError(description: error.localizedDescription)
                })

            case .finished:
                self?.dependencies.coordinator?.hideLoading(completion: nil)
            }
        } receiveValue: { [weak ownerView] movieDetail in
            ownerView?.showMovieDetail(movieDetail)
        }.store(in: &subscriptions)
    }
}

extension MovieDetailPresenter: MovieDetailPresenterType {}
