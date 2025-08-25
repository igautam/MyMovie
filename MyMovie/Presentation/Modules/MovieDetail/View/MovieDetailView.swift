//
//  MovieDetailView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject private var viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack(alignment: .center) {
                Text(viewModel.movieTitle)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.black)
                if let imageURL = viewModel.movieBackdropMovieImageURL {
                    ImageView(imageUrl: imageURL)
                }
                Text(viewModel.movieOverView)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding()
        }
        
    }
}

#Preview {
    let movie = Movie(
        id: 755898,
        title: "War of the Worlds",
        overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats",
        posterPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg",
        backdropPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
    MovieDetailView(
        viewModel: MovieDetailViewModel(
            movie: movie,
            movieDetailService: MovieDetailService(
                apiClientService: APIClientService()
            )
        )
    )
}
