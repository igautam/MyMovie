//
//  MovieServiceInterface.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

protocol MovieServiceInterface {
    func fetchMovies() async throws -> [Movie]
}
