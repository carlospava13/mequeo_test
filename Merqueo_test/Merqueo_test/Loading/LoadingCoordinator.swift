//
//  LoadingCoordinator.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

final class LoadingCoordinator: BaseCoordinator {
    
    private lazy var loadingViewController = LoadingViewController()
    
    override func start() {
        loadingViewController = LoadingViewController()
        loadingViewController.modalTransitionStyle = .coverVertical
        loadingViewController.modalTransitionStyle = .crossDissolve
        loadingViewController.modalPresentationStyle = .overCurrentContext
        router.rootViewController?.present(loadingViewController, animated: false, completion: nil)
    }
    
    func dismiss() {
        router.dismiss(loadingViewController, animated: false)
    }
}
