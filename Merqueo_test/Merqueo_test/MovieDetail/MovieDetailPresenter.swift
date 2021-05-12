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
        } receiveValue: { [weak self] movieDetail in
            self?.buildView(movieDetail)
        }.store(in: &subscriptions)
    }

    private func buildView(_ movieDetail: MovieDetailCoreDto) {
        var movieDetailFactory = [MovieDetailObjectViewType]()
        movieDetailFactory.append(MovieDetailObjectView(
            title: "Titulo",
            description: movieDetail.originalTitle))
        movieDetailFactory.append(MovieDetailObjectView(
            title: "Resumen",
            description: movieDetail.overview))
        movieDetailFactory.append(fillGenres(genresList: movieDetail.genres))
        
        ownerView.showMovieDetail(MovieDetailContainerObject(
            backdropPath: movieDetail.backdropPath,
            originalTitle: movieDetail.originalTitle,
            movieDetailObjectViews: movieDetailFactory,
            productionCompanyViews: fillProductionCompanies(productionCompanyList: movieDetail.productionCompanies)))
    }

    private func fillProductionCompanies(productionCompanyList: [ProductionCompaniesCoreDto]) -> [MovieDetailObjectViewType] {
        var productionCompanies = [MovieDetailObjectViewType]()
        productionCompanyList.forEach { productionCompany in
            productionCompanies.append(MovieDetailObjectView(
                title: productionCompany.name,
                description: productionCompany.logoPath))
        }
        return productionCompanies
    }

    private func fillGenres(genresList: [GenresCoreDto]) -> MovieDetailObjectView {
        var genres = String()
        genresList.forEach { genre in
            genres.append("\(genre.name), ")
        }
        return MovieDetailObjectView(
            title: "Generos",
            description: genres)
    }
}

extension MovieDetailPresenter: MovieDetailPresenterType {}
