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
//        try await Task.sleep(nanoseconds: 1_000_000_000)
//        let movies = [
//            Movie(id: 755898, title: "War of the Worlds_1",  overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats", poster_path: "/yvirUYrva23IudARHn3mMGVxWqM.jpg"),
//            Movie(id: 575265, title: "Mission: Impossible - The Final Reckoning",  overview: "Ethan Hunt and team continue their search for the terrifying AI known as the Entity — which has infiltrated intelligence networks all over the globe — wit", poster_path: "/z53D72EAOxGRqdr7KXXWp9dJiDe.jpg")
//        ]
        let movies = try await movieService.fetchMovies()
        state = .loaded(movies)
    }
}
