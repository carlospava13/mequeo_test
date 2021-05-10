//
//  DialogCoordinator.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 9/05/21.
//

import Foundation

final class DialogCoordinator: BaseCoordinator {
    
    weak var delegate: DialogViewDelegate?
    
    init(router: RouterType, delegate: DialogViewDelegate?) {
        super.init(router: router)
        self.delegate = delegate
    }
    
    private lazy var dialogViewController = DialogViewController()
    
    func start(description: String) {
        dialogViewController.modalTransitionStyle = .coverVertical
        dialogViewController.modalTransitionStyle = .crossDissolve
        dialogViewController.modalPresentationStyle = .overCurrentContext
        dialogViewController.delegate = delegate
        dialogViewController.set(description: description)
        router.rootViewController?.present(dialogViewController, animated: false, completion: nil)
    }
    
    func dismiss() {
        router.dismiss(dialogViewController, animated: false)
        removeReferenceDelegete?.removeReference(self)
    }
}

