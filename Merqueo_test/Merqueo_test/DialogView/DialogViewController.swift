//
//  DialogViewController.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 9/05/21.
//

import UIKit

final class DialogViewController: UIViewController {
    
    private lazy var diagloView = DialogView()
    weak var delegate: DialogViewDelegate? {
        didSet {
            diagloView.delegate = delegate
        }
    }
    
    override func loadView() {
        view = diagloView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        diagloView.set(title: "Upps")
        diagloView.set(actionTitle: "Intentar de nuevo")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        diagloView.viewDidAppear()
    }
    
    func set(description: String) {
        diagloView.set(description: description)
    }
}
