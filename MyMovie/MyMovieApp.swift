//
//  MyMovieApp.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

@main
struct MyMovieApp: App {
    let configuration = Configuration(apiClientService: APIClientService())
    var body: some Scene {
        WindowGroup {
           MovieView(
            viewModel: MovieViewModel(
                movieService: MovieService(
                    apiClientService: APIClientService()
                )
            )
           )
        }
    }
}

class Configuration: ObservableObject {
    let apiClientService: APIClientServiceInterface
    
    init(apiClientService: APIClientServiceInterface) {
        self.apiClientService = apiClientService
    }
}
