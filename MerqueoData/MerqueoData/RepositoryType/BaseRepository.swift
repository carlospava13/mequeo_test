//
//  BaseRepository.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

public protocol BaseRepositoryType {
    init(service: ApiClientType)
}

public class BaseRepository: BaseRepositoryType {
    let settings = Settings()
    let service: ApiClientType
    public required init(service: ApiClientType) {
        self.service = service
    }
}
