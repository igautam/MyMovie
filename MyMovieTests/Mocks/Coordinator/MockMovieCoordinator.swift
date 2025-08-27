//
//  MockMovieCoordinator.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 26/08/25.
//

import Foundation
import SwiftUICore

@testable import MyMovie

final class MockMovieCoordinator {
    var router: Router

    init(router: Router) {
        self.router = router
    }
    
    func navigate(to destination: any Hashable) {
        router.navPath.append(destination)
    }

    func navigateBack() {
        router.navPath.removeLast()
    }
    
    @ViewBuilder
    func build() -> some View {
        EmptyView()
    }
    
    // MARK: Flow Control Methods
    func showMovieDetail(movie: Movie) {
        let coordinator = MockMovieDetailCoordinator(
            movie: movie,
            router: router)
        router.navPath.append(coordinator)
    }
}
