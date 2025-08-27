//
//  MovieDetailService.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation

protocol MovieDetailServiceInterface {}

final class MovieDetailService: MovieDetailServiceInterface {
    private let apiClientService: APIClientServiceInterface
    
    init(apiClientService: APIClientServiceInterface) {
        self.apiClientService = apiClientService
    }
}
