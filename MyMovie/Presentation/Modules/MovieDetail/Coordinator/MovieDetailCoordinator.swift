//
//  MovieDetailCoordinator.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 26/08/25.
//

import Foundation
import SwiftUI

final class MovieDetailCoordinator: Hashable {
    private var id: UUID
    private var movie: Movie
    private var router: Router
    private var configuration: Configuration
    
    init(
        movie: Movie,
        router: Router,
        configuration: Configuration) {
        self.id = UUID()
        self.movie = movie
        self.router = router
        self.configuration = configuration
    }

    // MARK: Required methods for class to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MovieDetailCoordinator, rhs: MovieDetailCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
    
    // MARK: Navigation
    func getNavigationCount() -> Int {
        return router.navPath.count
    }
    
    // MARK: Build View
    @MainActor @ViewBuilder
    func build() -> some View {
        let viewModel = MovieDetailViewModel(
            movie: movie,
            movieDetailService: MovieDetailService(
                apiClientService: configuration.apiClientService
            )
        )
        MovieDetailView(viewModel: viewModel)
    }
}
