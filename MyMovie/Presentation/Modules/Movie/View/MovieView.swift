//
//  MovieView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

struct MovieView: View {
    @ObservedObject private var viewModel: MovieViewModel
    @StateObject private var router = Router()
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
    }
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack(path: $router.navPath) {
            contentView()
                .navigationTitle("Movies")
                .navigationDestination(for: Destination.self) { destination in
                    self.viewModel.view(for: destination)
                }
        }
        .onAppear {
            print("OnAppear call")
        }
        .task {
            print("task call")
            do {
                try await viewModel.loadData()
            } catch {
                print("Error: \(error)")
            }
        }
        .environmentObject(router)
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
                                    router.navigate(to: Destination.movieDetail(movie: movie))
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
