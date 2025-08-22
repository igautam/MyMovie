//
//  MockMovieViewModel.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import SwiftUI

@MainActor
final class MockMovieViewModel: ViewModelInterface {
    private let movieService: MovieServiceInterface
    @Published var state: DataLoadingState = .idle

    init(movieService: MovieServiceInterface) {
        self.movieService = movieService
    }
        
    func loadData() async throws {
        state = .loading
        let movies = try await movieService.fetchMovies()
        state = .loaded(movies)
    }
}
