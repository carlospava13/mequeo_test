//
//  LoadingViewController.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import UIKit

final class LoadingViewController: UIViewController {
    private lazy var indicatorActivityView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setIndicationActivityViewConstraints()
        indicatorActivityView.startAnimating()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    }

    private func setIndicationActivityViewConstraints() {
        view.addSubview(indicatorActivityView)
        NSLayoutConstraint.activate([
            indicatorActivityView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            indicatorActivityView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
