//
//  BaseViewController.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    var presenter: BasePresenterType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.bind(self)
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

extension BaseViewController: BaseViewType { }
