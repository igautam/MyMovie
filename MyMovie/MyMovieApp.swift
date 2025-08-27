//
//  MyMovieApp.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 27/08/25.
//

import SwiftUI

@main
struct MyMovieApp: App {
    @StateObject private var router = Router()
    private let configuration = Configuration(apiClientService: APIClientService())
    var body: some Scene {
        WindowGroup {
            CoordinatorView(
                coordinator: MovieCoordinator(
                    router: router,
                    configuration: configuration
                )
            )
            .environmentObject(router)
        }
    }
}

class Configuration: ObservableObject {
    let apiClientService: APIClientServiceInterface
    
    init(apiClientService: APIClientServiceInterface) {
        self.apiClientService = apiClientService
    }
}
