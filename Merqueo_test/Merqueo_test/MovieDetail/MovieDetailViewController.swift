//
//  MovieDetailViewController.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 10/05/21.
//

import MerqueoCore

final class MovieDetailViewController: BaseViewController {
    private lazy var movieDetailView = MovieDetailView()
    override func loadView() {
        view = movieDetailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
}

extension MovieDetailViewController: MovieDetailViewType {
    func showMovieDetail(_ detail: MovieDetailContainerObject) {
        movieDetailView.showMovieDetail(detail)
    }
}
