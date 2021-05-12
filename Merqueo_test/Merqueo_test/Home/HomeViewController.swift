//
//  HomeViewController.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

final class HomeViewController: BaseViewController {
    private var homeView = HomeView()

    private var ownerPresenter: HomePresenterType! {
        presenter as? HomePresenterType
    }
    
    override func loadView() {
        homeView.delegate = self
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarColor()
        title = "Movies"
    }
}

extension HomeViewController: HomeViewType {
    func endRefresh() {
        homeView.endRefresh()
    }

    func set(movies: [MovieObjectView]) {
        homeView.set(movies: movies)
    }
}

extension HomeViewController: HomeViewDelegate {
    func didMovieSelected(_ movie: MovieObjectView) {
        ownerPresenter.movieSelected(movie)
    }
    
    func refresh() {
        ownerPresenter.refreshMovies()
    }
}
