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
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            VStack {
                switch viewModel.state {
                case .idle:
                    Text("My Movies")
                case .loading:
                    ProgressView()
                case .loaded(let movies):
                    List {
                        ForEach(movies) { movie in
                            HStack {
                                ImageView(imageUrlStr: movie.movieImageURL)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(28)
                                    .onTapGesture {
                                        router.navigate(to: Destination.movieDetail(movie: movie))
                                    }
                                VStack(alignment: .leading) {
                                    Text("\(movie.title ?? "")")
                                        .font(.system(size: 24, weight: .bold))
    //                                Text("\(movie.overview ?? "")")
                                }
                            }
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.top)
                case .error(let error):
                    Text("Error ... : \(error)")
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .navigationDestination(for: Destination.self, destination: { destination in
            switch destination {
            case let .movieDetail(movie):
                MovieDetailView(
                    movie: movie,
                    viewModel: MovieDetailViewModel(
                        movieService: MovieDetailService(apiClientService: APIClientService())))
            }
        })
        .ignoresSafeArea(edges: .top)
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
        switch viewModel.state {
        case .idle:
            Text("My Movies")
        case .loading:
            ProgressView()
        case .loaded(let movies):
            List {
                ForEach(movies) { movie in
                    HStack {
                        ImageView(imageUrlStr: movie.movieImageURL)
                            .frame(width: 100, height: 100)
                            .cornerRadius(28)
                        VStack(alignment: .leading) {
                            Text("\(movie.title ?? "")")
                                .font(.system(size: 24, weight: .bold))
//                            Text("\(movie.overview ?? "")")
                        }
                    }
                }
            }.backgroundStyle(.blue)
        case .error(let error):
            Text("Error ... : \(error)")
        }
    }
}

#Preview {
    ContentView(viewModel: MockMovieViewModel(movieService: MovieService(apiClientService: APIClientService())))
}
