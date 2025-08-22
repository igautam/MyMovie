//
//  Environment.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation

enum Environment: String {
    case dev = "Debug"
    case stage = "Staging"
    case prod = "Production"
    static var current: Environment {
        if let value = Bundle.main.object(forInfoDictionaryKey: "Environment") as? String,
            let env = Environment(rawValue: value) {
            return env
        }
        return .dev
    }
    var apiURL: String {
        switch self {
        case .dev, .stage:
            return "https://api.themoviedb.org/3/discover/movie?api_key=c5b952eaa394e8f87c92654aefde03a4&page=1"
        case .prod:
            return "https://api.themoviedb.org/3/discover/movie?api_key=c5b952eaa394e8f87c92654aefde03a4&page=1"
        }
    }
}
