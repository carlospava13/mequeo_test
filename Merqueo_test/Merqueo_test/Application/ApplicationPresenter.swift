//
//  ApplicationPresenter.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

final class ApplicationPresenter: BasePresenter {
    
    struct InputDependencies {
        let coordinator: ApplicationCoordinatorDelegate?
    }
    
    private var dependencies: InputDependencies
    
    init(dependencies: InputDependencies) {
        self.dependencies = dependencies
    }
    
    override func viewDidLoad() {
        dependencies.coordinator?.showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { // Change `2.0` to the
            self.dependencies.coordinator?.hideLoading()
        }
    }
}

extension ApplicationPresenter: ApplicationPresenterType {
    
}
