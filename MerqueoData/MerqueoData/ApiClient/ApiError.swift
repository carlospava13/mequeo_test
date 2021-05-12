//
//  ApiError.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

enum ApiError: Error {
    case notFound
    case badContent
    case responseUnsuccessful
}
