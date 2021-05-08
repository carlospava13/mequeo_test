//
//  BasePresenter.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

class BasePresenter: BasePresenterType {
    
    weak var view: BaseViewType?
    
    func viewDidLoad() {
        // this method should be override
    }
    
    func viewWillAppear() {
        // this method should be override
    }
    
    deinit {
        self.view = nil
    }
    
    func bind(_ view: BaseViewType) {
        self.view = view
    }
}
