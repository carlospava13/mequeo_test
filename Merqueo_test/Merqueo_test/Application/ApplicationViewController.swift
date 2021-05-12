//
//  ApplicationViewController.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 8/05/21.
//

import UIKit

final class ApplicationViewController: BaseViewController {
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "movie")
        return imageView
    }()
    
    private var ownPresenter: ApplicationPresenterType! {
        presenter as? ApplicationPresenterType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImageViewConstraints()
        view.backgroundColor = .red
    }
    
    private func setImageViewConstraints() {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

extension ApplicationViewController: ApplicationView {
    
}
