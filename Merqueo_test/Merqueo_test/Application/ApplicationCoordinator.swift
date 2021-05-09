//
//  ApplicationCoordinator.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation
import MerqueoCore
import MerqueoData

protocol ApplicationCoordinatorDelegate: AnyObject {
    func showLoading()
    func hideLoading()
    func showHome()
}

final class ApplicationCoordinator: BaseCoordinator {
    private lazy var loadindCoordinator: LoadingCoordinator? = {
        LoadingCoordinator(router: router)
    }()
    
    private lazy var homeCoordinator: HomeCoordinator = {
        HomeCoordinator(router: router)
    }()

    override func start() {
        let applicationViewController = ApplicationViewController()
        let apiClient = ApiClient()
        let dataStorage = DataStorage()
        let getTokenRepository = GetTokenRepository(service: apiClient)
        let saveTokenRepository = SaveTokenRepository(dataStorage: dataStorage)
        let saveTokenInteractor = SaveTokenInteractor(
            getTokenRepository: getTokenRepository,
            saveTokenRepository: saveTokenRepository)
        let dependencies = ApplicationPresenter.InputDependencies(
            coordinator: self,
            saveInteractor: saveTokenInteractor)
        let presenter = ApplicationPresenter(dependencies: dependencies)
        applicationViewController.presenter = presenter
        router.setRootModule(applicationViewController.toPresent(),
                             hideBar: true,
                             animated: false)
    }
}

extension ApplicationCoordinator: RemoveReferenceDelegate {
    func removeReference(_: BaseCoordinator) {
        removeDependency(self)
    }
}

extension ApplicationCoordinator: ApplicationCoordinatorDelegate {
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
    
    func showHome() {
        DispatchQueue.main.async {
            self.homeCoordinator.start()
        }
    }
}
