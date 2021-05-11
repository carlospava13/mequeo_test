//
//  MovieDetailViewController.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 10/05/21.
//

import Foundation

final class MovieDetailViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension MovieDetailViewController: MovieDetailViewType {
    
}
