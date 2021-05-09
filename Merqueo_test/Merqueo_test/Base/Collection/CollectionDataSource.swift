//
//  CollectionDataSource.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 9/05/21.
//

import UIKit

class CollectionDataSource<Data: ObjectView, Cell: CollectionViewCell<Data>>: NSObject, UICollectionViewDataSource {
    
    private var data: [Data] = []
    private var identifier: CollectionCellIdentifier = .none
    
    init(identifier: CollectionCellIdentifier) {
        self.identifier = identifier
    }
    
    func set(data: [Data]) {
        self.data = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier.rawValue, for: indexPath) as? Cell else {
            return UICollectionViewCell()
        }
        cell.set(data: data[indexPath.row])
        return cell
    }
}
