//
//  DialogView.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 9/05/21.
//

import UIKit

protocol DialogViewDelegate: AnyObject {
    func tryAgain()
}

final class DialogView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    private lazy var descritionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onAction(_:)), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = .red
        return button
    }()
    
    weak var delegate: DialogViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setContainerConstraints()
        setTitleLabelConstraints()
        setDescriptionLabelConstraints()
        setActionButtonConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
        actionButton.layer.cornerRadius = 10
    }

    private func setContainerConstraints() {
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }

    private func setTitleLabelConstraints() {
        containerView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }

    private func setDescriptionLabelConstraints() {
        containerView.addSubview(descritionLabel)
        NSLayoutConstraint.activate([
            descritionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descritionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            descritionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }

    private func setActionButtonConstraints() {
        containerView.addSubview(actionButton)
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: descritionLabel.bottomAnchor, constant: 16),
            actionButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            actionButton.widthAnchor.constraint(equalToConstant: 140),
            actionButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func set(title: String) {
        titleLabel.text = title
    }

    func set(description: String) {
        descritionLabel.text = description
    }

    func set(actionTitle: String) {
        actionButton.setTitle(actionTitle, for: .normal)
    }

    func viewDidAppear() {
        UIView.animate(withDuration: 1) {
            self.containerView.alpha = 1
        }
    }

    @objc private func onAction(_: UIButton) {
        delegate?.tryAgain()
    }
}
