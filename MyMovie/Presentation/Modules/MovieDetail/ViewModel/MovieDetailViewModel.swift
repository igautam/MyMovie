//
//  MovieDetailViewModel.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import SwiftUI

@MainActor
final class MovieDetailViewModel: ObservableObject {
    private let movieDetailService: MovieDetailServiceInterface
    private let movie: Movie
    weak private var coordinator: MovieDetailCoordinator?
    
    init(
        movie: Movie,
        movieDetailService: MovieDetailServiceInterface,
        coordinator: MovieDetailCoordinator
    ) {
        self.movie = movie
        self.movieDetailService = movieDetailService
        self.coordinator = coordinator
    }
    
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
