//
//  HomeView.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 9/05/21.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func didMovieSelected(_ movie: MovieObjectView)
    func refresh()
}

final class HomeView: UIView {
    
    private lazy var refreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        refreshControl.tintColor = .white
        return refreshControl
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flow = CollectionViewHorizontalCustom()
        flow.height = 175
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCell.self,
                                forCellWithReuseIdentifier: CollectionCellIdentifier.movie.rawValue)
        collectionView.addSubview(refreshControl)
        return collectionView
    }()
    
    private lazy var dataSource: HomeDataSource = {
        let datasource = HomeDataSource(identifier: .movie)
        datasource.homeDataSourceDelegate = self
        collectionView.dataSource = datasource
        collectionView.delegate = datasource
        return datasource
    }()
    
    weak var delegate: HomeViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setCollectionViewConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCollectionViewConstraints() {
        addSubview(collectionView)
        let guides = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: guides.topAnchor, constant: 4),
            collectionView.leadingAnchor.constraint(equalTo: guides.leadingAnchor, constant: 4),
            collectionView.trailingAnchor.constraint(equalTo: guides.trailingAnchor, constant: -4),
            collectionView.bottomAnchor.constraint(equalTo: guides.bottomAnchor, constant: -4)
        ])
    }
    
    func set(movies: [MovieObjectView]) {
        dataSource.set(data: movies)
    }
    
    @objc private func onRefresh() {
        delegate?.refresh()
    }
    
    func endRefresh() {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
}

extension HomeView: HomeDataSourceDelegate {
    func didMovieSelected(_ movie: MovieObjectView) {
        delegate?.didMovieSelected(movie)
    }
}
