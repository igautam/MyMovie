//
//  MovieView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

struct MovieView<ViewModel>: View where ViewModel: ViewModelInterface {
    @ObservedObject var viewModel: ViewModel
    @StateObject var router = Router()
    
    let mockItems = ["Item 1", "Item 2", "Item 3"]
    
    init(viewModel: ViewModel) {
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
                    switch destination {
                    case let .movieDetail(movie):
                        MovieDetailView(
                            movie: movie,
                            viewModel: MovieDetailViewModel(
                                movieService: MovieDetailService(apiClientService: APIClientService())))
                    }
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
    }
    
    @ViewBuilder
    func contentView() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                switch viewModel.state {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                case .loaded(let movies):
                    ForEach(movies) { movie in
                        HStack {
                            MovieCardView(movie: movie)
                                .onTapGesture {
                                    router.navigate(to: Destination.movieDetail(movie: movie))
                                }
                        }
                    }
                    
                case .error(let error):
                    Text("Error ... : \(error)")
                }
            }
            
        }
    }
}

#Preview {
    MovieView(viewModel: MockMovieViewModel())
}
