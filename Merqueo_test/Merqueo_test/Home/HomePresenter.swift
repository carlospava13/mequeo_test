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

    private let dependencies: InputDependencies
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }
    
    override func viewDidLoad() {
        getMovies()
    }
    
    private func getMovies() {
        dependencies.getMoviesInteractor.getMovies().sink { (completion) in
            switch completion {
            case .failure(let error):
                print(error)
            case .finished:
                print("Finished")
            }
        } receiveValue: { (movies) in
            print(movies)
        }.store(in: &subscriptions)
    }
}

extension HomePresenter: HomePresenterType {}
