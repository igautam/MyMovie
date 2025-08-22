//
//  MockMovieService.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation

@testable import MyMovie

final class MockMovieService: MovieServiceInterface {
    private var apiClientService: APIClientServiceInterface = APIClientService()
    private let error: Error?
    private let movies: [Movie]
    
    init(movies: [Movie], apiClientService: APIClientServiceInterface, error: Error? = nil) {
        self.apiClientService = apiClientService
        self.movies = movies
        self.error = error
    }
    
    func fetchMovies() async throws -> [Movie] {
        if let error = error {
            throw error
        }
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return movies
    }
    
}
