//
//  MovieDetailView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

struct MovieDetailView<ViewModel>: View where ViewModel: ViewModelInterface {
    @ObservedObject var viewModel: ViewModel
    @StateObject var router = Router()
    var movie: Movie
    
    let mockItems = ["Item 1", "Item 2", "Item 3"]
    
    init(movie: Movie, viewModel: ViewModel) {
        self.movie = movie
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(movie.title ?? "")")
                .font(.system(size: 24, weight: .bold))
            ImageView(imageUrlStr: movie.backdropMovieImageURL)
            Text(movie.overview ?? "")
            Spacer()
        }
        .padding()
        .onAppear {
            print("OnAppear call")
        }
        .task {
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

//#Preview {
//    ContentView(viewModel: MockViewModel(movieService: MockMovieService(apiClientService: MockAPIClientService())))
//}
