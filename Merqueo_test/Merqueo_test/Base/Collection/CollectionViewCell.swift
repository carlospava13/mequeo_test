//
//  CollectionViewCell.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 9/05/21.
//

import UIKit

enum CollectionCellIdentifier: String {
    case none
    case movie
    case home
}

class CollectionViewCell<Data: ObjectView>: UICollectionViewCell {
    func set(data: Data) {}
}
