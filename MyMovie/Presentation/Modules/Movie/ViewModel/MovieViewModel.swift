//
//  MovieViewModel.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import SwiftUI

@MainActor
final class MovieViewModel: ObservableObject {
    private let movieService: MovieServiceInterface
    weak private var coordinator: MovieCoordinator?
    @Published var state: DataLoadingState = .idle

    init(
        movieService: MovieServiceInterface,
        coordinator: MovieCoordinator
    ) {
        self.movieService = movieService
        self.coordinator = coordinator
        Task {
            do {
                try await loadData()
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    enum DataLoadingState {
        case idle
        case loading
        case loaded([Movie])
        case error(Error)
    }
    
    func loadData() async throws {
        state = .loading
        let movies = try await movieService.fetchMovies()
        state = .loaded(movies)
    }
    
    func showMovieDetail(movie: Movie) {
        self.coordinator?.showMovieDetail(movie: movie)
    }
}
