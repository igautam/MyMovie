//
//  MockMovieDetailCoordinator.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 26/08/25.
//

import Foundation
import SwiftUI

@testable import MyMovie

final class MockMovieDetailCoordinator: Hashable {
    private var id: UUID
    private var movie: Movie
    private var router: Router
    
    init(
        movie: Movie,
        router: Router) {
        self.id = UUID()
        self.movie = movie
        self.router = router
    }
    
    // MARK: Required methods for class to conform to Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MockMovieDetailCoordinator, rhs: MockMovieDetailCoordinator) -> Bool {
        return lhs.id == rhs.id
    }
    
    // MARK: Navigation
    func navigate(to destination: any Hashable) {
        router.navPath.append(destination)
    }

    func navigateBack() {
        router.navPath.removeLast()
    }
    
    // MARK: Build View
    @MainActor @ViewBuilder
    func build() -> some View {
        EmptyView()
    }

}
