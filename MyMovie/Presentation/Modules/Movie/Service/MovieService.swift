//
//  MovieService.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation

final class MovieService: MovieServiceInterface {
    
    private let apiClientService: APIClientServiceInterface
    
    init(apiClientService: APIClientServiceInterface) {
        self.apiClientService = apiClientService
    }
    
    func fetchMovies() async throws -> [Movie] {
        let urlString = Environment.current.apiURL
        let response = try await apiClientService.request(urlString, for: PaginatedResponse<Movie>.self)
        return response.results ?? []
    }    
}
