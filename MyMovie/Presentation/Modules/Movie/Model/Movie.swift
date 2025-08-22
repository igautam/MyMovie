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
    var posterPath: String?
    var backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case overview = "overview"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        
    }
    var movieImageURL: String? {
        guard let posterPath = posterPath else {
            return nil
        }
        return "https://image.tmdb.org/t/p/w154\(posterPath)"
    }
    
    var backdropMovieImageURL: String? {
        guard let backdropPath = backdropPath else {
            return nil
        }
        return "https://image.tmdb.org/t/p/w1280\(backdropPath)"
    }
}

enum Destination: Hashable {
    case movieDetail(movie: Movie)
}
