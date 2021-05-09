//
//  BaseCoordinator.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import UIKit

protocol BaseCoordinatorType: AnyObject {
    func showLoading()
    func hideLoading()
}

class BaseCoordinator: CoordinatorType {
    
    var childCoordinators: [CoordinatorType] = []
    var router: RouterType
    weak var removeReferenceDelegete: RemoveReferenceDelegate?
    
    private lazy var loadindCoordinator: LoadingCoordinator? = {
        LoadingCoordinator(router: router)
    }()
    
    
    init(router: RouterType) {
        self.router = router
    }

    func start() {}

    func addDependency(_ coordinator: CoordinatorType) {
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }

    func removeDependency(_ coordinator: CoordinatorType?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }

        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

    func toPresent() -> UIViewController {
        let viewController = router.toPresent()
        viewController.modalPresentationStyle = .overFullScreen
        return viewController
    }
}

extension BaseCoordinator: BaseCoordinatorType {
    func showLoading() {
        DispatchQueue.main.async {
            self.loadindCoordinator?.start()
        }
    }

    func hideLoading() {
        DispatchQueue.main.async {
            self.loadindCoordinator?.dismiss()
        }
    }
}
