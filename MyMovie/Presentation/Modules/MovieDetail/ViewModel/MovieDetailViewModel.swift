//
//  MovieDetailViewModel.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import SwiftUI

@MainActor
class MovieDetailViewModel: ObservableObject {
    private let movieDetailService: MovieDetailServiceInterface
    private let movie: Movie
    var movieTitle: String {
        movie.title ?? ""
    }
    var movieBackdropMovieImageURL: String? {
        movie.backdropMovieImageURL
    }
    var movieOverView: String {
        movie.overview ?? ""
    }
    
    init(movie: Movie, movieDetailService: MovieDetailServiceInterface) {
        self.movie = movie
        self.movieDetailService = movieDetailService
    }
}
