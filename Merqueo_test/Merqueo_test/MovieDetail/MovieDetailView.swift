//
//  MovieDetailView.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 11/05/21.
//

import MerqueoCore
import SDWebImage
import UIKit

final class MovieDetailView: UIView {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

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
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setScrollViewConstraints()
        setMovieImageViewConstraints()
        setStackViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setScrollViewConstraints() {
        addSubview(scrollView)
        let guides = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: guides.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: guides.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: guides.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: guides.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }

    private func setMovieImageViewConstraints() {
        scrollView.addSubview(movieImageView)
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            movieImageView.heightAnchor.constraint(equalToConstant: 230)

        ])
    }

    private func setStackViewConstraints() {
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }

    func showMovieDetail(_ detail: MovieDetailContainerObject) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + detail.backdropPath) else {
            return
        }
        movieImageView.sd_setImage(with: url) { _, _, _, _ in }
        build(detail)
        buildProductionCompanies(detail)
    }

    private func build(_ detail: MovieDetailContainerObject) {
        detail.movieDetailObjectViews.forEach { movieDetailObjectView in
            let movieDetailDescriptionView = MovieDetailDescriptionView()
            movieDetailDescriptionView.set(
                title: movieDetailObjectView.title,
                description: movieDetailObjectView.description)
            stackView.addArrangedSubview(movieDetailDescriptionView)
        }
    }
    
    private func buildProductionCompanies(_ detail: MovieDetailContainerObject) {
        detail.productionCompanyViews.forEach { (movieDetailObjectView) in
            let productionCompanyView = ProductionCompanyView()
            productionCompanyView.set(
                title: movieDetailObjectView.title,
                description: movieDetailObjectView.description)
            stackView.addArrangedSubview(productionCompanyView)
        }
    }
}
