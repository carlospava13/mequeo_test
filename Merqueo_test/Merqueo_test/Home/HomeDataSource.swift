//
//  HomeDataSource.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 9/05/21.
//

import UIKit

protocol HomeDataSourceDelegate: AnyObject {
    func didMovieSelected(_ movie: MovieObjectView)
}

final class HomeDataSource: CollectionDataSource<MovieObjectView,MovieCell> {
    
    weak var homeDataSourceDelegate: HomeDataSourceDelegate?
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeDataSourceDelegate?.didMovieSelected(data[indexPath.row])
    }
}
