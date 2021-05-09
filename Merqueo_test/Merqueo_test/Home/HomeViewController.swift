//
//  HomeViewController.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

final class HomeViewController: BaseViewController {
    
    private var homeView: HomeView = HomeView()
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarColor()
        title = "Movies"
    }
    
}

extension HomeViewController: HomeViewType {
    func set(movies: [MovieObjectView]) {
        DispatchQueue.main.async {
            self.homeView.set(movies: movies)
        }
    }
}
