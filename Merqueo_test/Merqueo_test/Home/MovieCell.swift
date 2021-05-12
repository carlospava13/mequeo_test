//
//  MovieCell.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 9/05/21.
//

import UIKit
import SDWebImage
final class MovieCell: CollectionViewCell<MovieObjectView> {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setImageViewConstraints() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    override func set(data: MovieObjectView) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + data.posterPath) else {
            return
        }
        imageView.sd_setImage(with: url) { (_, _, _, _) in }
    }
}
