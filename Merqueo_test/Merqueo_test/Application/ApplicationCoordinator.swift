//
//  ApplicationCoordinator.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

protocol ApplicationCoordinatorDelegate: AnyObject {

}

final class ApplicationCoordinator: BaseCoordinator {
    override func start() {
        let applicationViewController = ApplicationViewController()
        let dependencies = ApplicationPresenter.InputDependencies(coordinator: self)
        let presenter = ApplicationPresenter(dependencies: dependencies)
        applicationViewController.presenter = presenter
        router.setRootModule(applicationViewController.toPresent())
    }
}

extension ApplicationCoordinator: RemoveReferenceDelegate {
    func removeReference(_ coodinator: BaseCoordinator) {
        removeDependency(self)
      
    }
}
 
extension ApplicationCoordinator: ApplicationCoordinatorDelegate {
}
