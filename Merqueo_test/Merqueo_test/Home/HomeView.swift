//
//  HomeView.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 9/05/21.
//

import UIKit

final class HomeView: UIView {
    
    private lazy var collectionView: UICollectionView = {
        let flow = CollectionViewHorizontalCustom()
        flow.height = 50
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCell.self,
                                forCellWithReuseIdentifier: CollectionCellIdentifier.movie.rawValue)
        return collectionView
    }()
    
    private lazy var dataSource: HomeDataSource = {
        let datasource = HomeDataSource(identifier: .movie)
        collectionView.dataSource = datasource
        return datasource
    }()

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
            collectionView.topAnchor.constraint(equalTo: guides.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: guides.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: guides.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: guides.bottomAnchor)
        ])
    }
    
    func set(movies: [MovieObjectView]) {
        dataSource.set(data: movies)
    }
}
