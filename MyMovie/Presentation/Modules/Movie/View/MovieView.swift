//
//  MovieView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

struct MovieView: View {
    @ObservedObject private var viewModel: MovieViewModel
    @StateObject private var coordinator: Coordinator = Coordinator()
    @EnvironmentObject private var configuration: Configuration
    
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
    }
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack(path: $coordinator.navPath) {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                contentView()
            }
            .navigationTitle("Movies")
            .navigationDestination(for: Destination.self) { destination in
                coordinator.buildView(for: destination, configuration: configuration)
            }
        }
        .task {
            do {
                try await viewModel.loadData()
            } catch {
                print("Error: \(error)")
            }
        }
        .environmentObject(coordinator)
    }
    @ViewBuilder
    private func contentView() -> some View {
        switch viewModel.state {
        case .idle, .loading:
            Spacer()
            ProgressView()
                .scaleEffect(2.0)
            Spacer()
        case .loaded(let movies):
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(movies) { movie in
                        HStack {
                            MovieCardView(movie: movie)
                                .onTapGesture {
                                    coordinator.navigate(to: Destination.movieDetail(movie: movie))
                                }
                        }
                    }
                }
            }
        case .error:
            EmptyView()
        }
    }
}

#Preview {
    let service = MovieService(apiClientService: APIClientService())
    MovieView(viewModel: MovieViewModel(movieService: service))
}
