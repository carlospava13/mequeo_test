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
       
    }
}

extension ApplicationPresenter: ApplicationPresenterType {
    
}
