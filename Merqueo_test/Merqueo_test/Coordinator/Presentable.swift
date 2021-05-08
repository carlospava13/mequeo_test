//
//  Presentable.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}
