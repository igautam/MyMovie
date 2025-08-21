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
                                movieDetailService: MovieDetailService(apiClientService: APIClientService())))
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
                case .idle, .loading:
                    Spacer()
                    ProgressView()
                        .scaleEffect(2.0)
                    Spacer()
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
    let movie1 = Movie(id: 755898, title: "War of the Worlds_1",  overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats", poster_path: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
    let movie2 = Movie(id: 575265, title: "Mission: Impossible - The Final Reckoning",  overview: "Ethan Hunt and team continue their search for the terrifying AI known as the Entity — which has infiltrated intelligence networks all over the globe — wit", poster_path: "/z53D72EAOxGRqdr7KXXWp9dJiDe.jpg")
    
    let service = MockMovieService(movies: [movie1, movie2], apiClientService: APIClientService())
    MovieView(viewModel: MockMovieViewModel(movieService: service))
}
