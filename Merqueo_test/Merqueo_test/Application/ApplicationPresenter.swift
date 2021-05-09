//
//  ApplicationPresenter.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation
import MerqueoCore
final class ApplicationPresenter: BasePresenter {
    
    struct InputDependencies {
        let coordinator: ApplicationCoordinatorDelegate?
        let saveInteractor: SaveTokenInteractorType
    }
    
    private var dependencies: InputDependencies
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }
    
    override func viewDidLoad() {
       saveToken()
    }
    
    private func saveToken() {
        dependencies.coordinator?.showLoading()
        dependencies.saveInteractor.saveToken().sink { [weak self] _ in
            self?.dependencies.coordinator?.hideLoading()
            self?.dependencies.coordinator?.showHome()
        } receiveValue: { _ in }.store(in: &subscriptions)
    }
}

extension ApplicationPresenter: ApplicationPresenterType {
    
}
