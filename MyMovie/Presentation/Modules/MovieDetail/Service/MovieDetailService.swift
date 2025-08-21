//
//  MovieDetailService.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation

protocol MovieDetailServiceInterface {
    //TODO: fetch geners
}

final class MovieDetailService: MovieDetailServiceInterface {
    
    private let apiClientService: APIClientServiceInterface
    
    init(apiClientService: APIClientServiceInterface) {
        self.apiClientService = apiClientService
    }
    
}
