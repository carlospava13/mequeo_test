//
//  CollectionViewHorizontalCustom.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 9/05/21.
//

import UIKit

class CollectionViewHorizontalCustom: UICollectionViewFlowLayout {
    var height: CGFloat = 0.0 {
        didSet {
            configLayout()
        }
    }

    func configLayout() {
        minimumLineSpacing = 4
        minimumInteritemSpacing = 4
        scrollDirection = .vertical
        if let collectionView = collectionView {
            let optimisedWidth = (collectionView.frame.width - minimumInteritemSpacing) / 3 - 4
            itemSize = CGSize(width: optimisedWidth, height: height)
        }
    }

    override func invalidateLayout() {
        super.invalidateLayout()
        configLayout()
    }
}
