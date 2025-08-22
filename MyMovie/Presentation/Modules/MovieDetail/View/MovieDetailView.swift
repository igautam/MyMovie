//
//  MovieDetailView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject private var viewModel: MovieDetailViewModel
    @EnvironmentObject private var router: Router
    private var movie: Movie
    
    init(movie: Movie, viewModel: MovieDetailViewModel) {
        self.movie = movie
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(movie.title ?? "")")
                .font(.system(size: 24, weight: .bold))
            ImageView(imageUrl: movie.backdropMovieImageURL!)
            Text(movie.overview ?? "")
            Spacer()
        }
        .padding()
        .onAppear {
            print(router)
        }
    }
}

#Preview {
    MovieDetailView(
        movie: Movie(),
        viewModel: MovieDetailViewModel(
            movieDetailService: MovieDetailService(
                apiClientService: APIClientService()
            )
        )
    )
}
