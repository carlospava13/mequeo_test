//
//  MovieDetailAbstractFactory.swift
//  Merqueo_test
//
//  Created by Carlos Pava on 11/05/21.
//

import MerqueoCore

protocol MovieDetailObjectViewType: ObjectView {
    var title: String { get }
    var description: String { get }
}

struct MovieDetailObjectView: MovieDetailObjectViewType {
    var title: String
    var description: String
}

struct MovieDetailContainerObject {
    let backdropPath: String
    let originalTitle: String
    let movieDetailObjectViews: [MovieDetailObjectViewType]
    let productionCompanyViews: [MovieDetailObjectViewType]
}

protocol MovieDetailAbstractFactoryType {
    func build(detail: MovieDetailCoreDto) -> MovieDetailObjectViewType
}
