//
//  TokenDto.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

public struct TokenDto: Codable {
    public let success: Bool
    public let expiresAt: String
    public let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success = "success"
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
