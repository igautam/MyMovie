//
//  MovieDetailView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

struct MovieDetailView<ViewModel>: View where ViewModel: ViewModelInterface {
    @ObservedObject var viewModel: ViewModel
    var movie: Movie
    
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
    }
}

#Preview {
    MovieDetailView(movie: Movie(), viewModel: MovieDetailViewModel(movieDetailService: MovieDetailService(apiClientService: APIClientService())))
}
