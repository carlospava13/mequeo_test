//
//  RouterType.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import UIKit

protocol RouterType: AnyObject, Presentable {
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }
    func present(_ module: Presentable)
    func push(
        _ module: Presentable,
          transition: UIViewControllerAnimatedTransitioning?,
          animated: Bool,
          completion: (() -> Void)?)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    func setRootModule(_ module: Presentable)
    func popView()
}
