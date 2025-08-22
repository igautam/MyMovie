//
//  MovieViewModelTest.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Testing
import XCTest

@testable import MyMovie

@MainActor
final class MovieViewModelTest: XCTestCase {
    var sut: MovieViewModel?
    var movies: [Movie] = []
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    // MARK: - Success scenario
    // MARK: -
    func testGetCountMovies_2Movies_2() async {
        let movie1 = Movie(
            id: 755898,
            title: "War of the Worlds",
            overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats",
            posterPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg"
        )
        let movie2 = Movie(
            id: 575265,
            title: "Mission: Impossible - The Final Reckoning",
            overview: "Ethan Hunt and team continue their search for the terrifying AI",
            posterPath: "/z53D72EAOxGRqdr7KXXWp9dJiDe.jpg"
        )
        let service = MockMovieService(movies: [movie1, movie2], apiClientService: APIClientService())
        sut = MovieViewModel(movieService: service)
        do {
            try await sut?.loadData()
            if case let .loaded(movies) = sut?.state {
                XCTAssertTrue(movies.count == 2)
            }
        } catch { }
    }
    
    // MARK: - Failure scenario
    // MARK: -
    func testGet_Movies_API_FailureRsponse_WithInvalidResponseFormat() async {
        let service = MockMovieService(movies: [], apiClientService: APIClientService(), error: APIError.invalidURL)
        sut = MovieViewModel(movieService: service)
        do {
            try await sut?.loadData()
        } catch {
            if let error = error as? APIError {
                XCTAssertTrue(error == APIError.invalidURL)
            }
        }
    }
}
