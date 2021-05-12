//
//  BaseContract.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

protocol BasePresenterType: AnyObject {
    func bind(_ view: BaseViewType)
    func viewDidLoad()
    func viewDidDisappear()
}

protocol BaseViewType: AnyObject {
    
}
