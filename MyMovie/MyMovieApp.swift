//
//  MyMovieApp.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

@main
struct MyMovieApp: App {
    private let configuration = Configuration(apiClientService: APIClientService())
    var body: some Scene {
        WindowGroup {
            MovieView(
                viewModel: MovieViewModel(
                    movieService: MovieService(
                        apiClientService: configuration.apiClientService
                    )
                )
            )
            .environmentObject(configuration)
        }
    }
}

class Configuration: ObservableObject {
    let apiClientService: APIClientServiceInterface
    
    init(apiClientService: APIClientServiceInterface) {
        self.apiClientService = apiClientService
    }
}
