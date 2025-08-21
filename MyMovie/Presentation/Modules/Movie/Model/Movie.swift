//
//  Movie.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation

public struct PaginatedResponse<T: Decodable>: Decodable {
    var results: [T]?
}

struct Movie: Decodable, Identifiable, Hashable {
    var id: Int?
    var title: String?
    var overview: String?
    var poster_path: String?
    var backdrop_path: String?
    
    var movieImageURL: String? {
        guard let posterPath = poster_path else {
            return nil
        }
        return "https://image.tmdb.org/t/p/w154\(posterPath)"
    }
    
    var backdropMovieImageURL: String? {
        guard let backdropPath = backdrop_path else {
            return nil
        }
        return "https://image.tmdb.org/t/p/w1280\(backdropPath)"
    }
}

enum Destination: Hashable {
    case movieDetail(movie: Movie)
}
