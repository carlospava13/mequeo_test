//
//  Settings.swift
//  MerqueoData
//
//  Created by Carlos Pava on 8/05/21.
//

import Foundation

final class BundelData {}

struct Settings {
    private let bunlde = Bundle(for: BundelData.self)

    private var info: NSDictionary? {
        guard let path = bunlde.path(forResource: "merqueoSettings",
                                     ofType: "plist") else {
            return nil
        }
        return NSDictionary(contentsOfFile: path)
    }

    var apiKey: String {
        info!["apiKey"] as! String
    }
}
