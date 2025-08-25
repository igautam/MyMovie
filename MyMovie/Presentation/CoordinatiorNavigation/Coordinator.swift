//
//  Router.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

@MainActor
final class Coordinator: ObservableObject {
    @Published var navPath = NavigationPath()

    init() {}

    func navigate(to destination: any Hashable) {
        navPath.append(destination)
    }

    func navigateBack() {
        navPath.removeLast()
    }
    
    @ViewBuilder
    func buildView(for destination: Destination, configuration: Configuration) -> some View {
        switch destination {
        case .movieDetail(let movie):
            MovieDetailView(
                viewModel: MovieDetailViewModel(
                    movie: movie,
                    movieDetailService: MovieDetailService(
                        apiClientService: configuration.apiClientService
                    )
                )
            )
        }
    }
}
