//
//  MovieCoordinator.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 26/08/25.
//

import Foundation
import SwiftUI

@MainActor
final class MovieCoordinator {
    private var router: Router
    private var configuration: Configuration
    
    init(router: Router,
         configuration: Configuration) {
        self.router = router
        self.configuration = configuration
    }
    
    func navigateBack() {
        router.navPath.removeLast()
    }
    
    func getNavigationCount() -> Int {
        return router.navPath.count
    }
    
    @ViewBuilder
    func build() -> some View {
        let viewModel = MovieViewModel(
            movieService: MovieService(
                apiClientService: configuration.apiClientService
            ),
            coordinator: self
        )
        MovieView(viewModel: viewModel)
    }
    
    // MARK: Flow Control Methods
    func showMovieDetail(movie: Movie) {
        let coordinator = MovieDetailCoordinator(
            movie: movie,
            router: router,
            configuration: configuration)
        router.navPath.append(coordinator)
    }
}
