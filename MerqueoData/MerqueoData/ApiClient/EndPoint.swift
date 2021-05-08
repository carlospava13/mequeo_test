//
//  EndPoint.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

public struct EndPoint {
    private let baseUrl: String = "https://api.themoviedb.org/3/"
    var path: String
    var url: URL? {
        URL(string: baseUrl + path)
    }
}
