//
//  ApplicationViewController.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

final class ApplicationViewController: BaseViewController {
    
    private var ownPresenter: ApplicationPresenterType! {
        presenter as? ApplicationPresenterType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }
}

extension ApplicationViewController: ApplicationView {
    
}
