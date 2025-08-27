//
//  ContentView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 26/08/25.
//
import SwiftUI

struct CoordinatorView: View {
    private var coordinator: MovieCoordinator
    @EnvironmentObject private var router: Router
    
    init(coordinator: MovieCoordinator) {
        self.coordinator = coordinator
    }
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            coordinator.build()
                .navigationDestination(for: MovieDetailCoordinator.self) { coordinator in
                    coordinator.build()
                }
        }
    }
}
