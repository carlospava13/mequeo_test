//
//  BaseCoordinator.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import UIKit

protocol BaseCoordinatorType: AnyObject {
    func showLoading()
    func hideLoading(completion: (() -> Void)?)
    func showError(description: String)
}

class BaseCoordinator: CoordinatorType {
    var childCoordinators: [CoordinatorType] = []
    var router: RouterType
    weak var removeReferenceDelegete: RemoveReferenceDelegate?

    private lazy var loadindCoordinator: LoadingCoordinator? = {
        let coordinator = LoadingCoordinator(router: router)
        coordinator.removeReferenceDelegete = self
        return coordinator
    }()

    private lazy var dialogCoordinator: DialogCoordinator? = {
        let coordinator = DialogCoordinator(router: router, delegate: self)
        coordinator.removeReferenceDelegete = self
        return coordinator
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

    func hideLoading(completion: (() -> Void)?) {
        DispatchQueue.main.async {
            self.loadindCoordinator?.dismiss(completion: completion)
        }
    }

    func showError(description: String) {
        DispatchQueue.main.async {
            self.dialogCoordinator?.start(description: description)
        }
    }
}

extension BaseCoordinator: DialogViewDelegate {
    func tryAgain() {
        DispatchQueue.main.async {
            self.dialogCoordinator?.dismiss()
        }
    }
}

extension BaseCoordinator: RemoveReferenceDelegate {
    func removeReference(_ coodinator: BaseCoordinator) {
        removeDependency(coodinator)
    }
}
