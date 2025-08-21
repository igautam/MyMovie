//
//  Environment.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation

enum Environment : String {
    
    case Dev = "Development"
    case QA = "QA"
    case Prod = "Production"
    
    static var current: Environment {
        if let value = Bundle.main.object(forInfoDictionaryKey: "Environment") as? String,
            let env = Environment(rawValue: value) {
            return env
        }
        return .Dev
    }
    
    var apiURL: String {
        switch self {
        case .Dev, .QA:
            return "https://api.themoviedb.org/3/discover/movie?api_key=c5b952eaa394e8f87c92654aefde03a4&page=1"
        case .Prod:
            return "https://api.themoviedb.org/3/discover/movie?api_key=c5b952eaa394e8f87c92654aefde03a4&page=1"
        }
    }
}
