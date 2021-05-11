//
//  BasePresenter.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation
import Combine

class BasePresenter: BasePresenterType {
    
    weak var view: BaseViewType?
    var subscriptions = Set<AnyCancellable>()
    
    func viewDidLoad() {
        // this method should be override
    }
    
    func viewDidDisappear() {
        // this method should be override
    }
    
    deinit {
        self.view = nil
    }
    
    func bind(_ view: BaseViewType) {
        self.view = view
    }
}
