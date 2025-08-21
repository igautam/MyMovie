//
//  MockMovieViewModel.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import SwiftUI

@MainActor
class MockMovieViewModel: ViewModelInterface {
    private let movieService: MovieServiceInterface
    @Published var state: DataLoadingState = .idle

    init(movieService: MovieServiceInterface) {
        self.movieService = movieService
        Task {
            try await loadData()
        }
    }
    
    func loadData() async throws {
        let movies = [
            Movie(id: 755898, title: "War of the Worlds",  overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats", poster_path: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")]
        state = .loaded(movies)
    }
}
