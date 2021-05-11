//
//  MovieDetailView.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 11/05/21.
//

import UIKit
import MerqueoCore
import SDWebImage

final class MovieDetailView: UIView {
    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.backgroundColor = .red
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setMovieImageViewConstraints()
        setStackViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setMovieImageViewConstraints() {
        addSubview(movieImageView)
        let guides = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: guides.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: guides.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: guides.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 230)
            
        ])
    }
    
    private func setStackViewConstraints() {
        addSubview(stackView)
        let guides = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: guides.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: guides.trailingAnchor),
            //movieImageView.bottomAnchor.constraint(equalTo: guides.bottomAnchor)
            
        ])
    }
    
    func showMovieDetail(_ detail: MovieDetailCoreDto) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + detail.backdropPath) else {
            return
        }
        movieImageView.sd_setImage(with: url) { (_, _, _, _) in }
    }
}
