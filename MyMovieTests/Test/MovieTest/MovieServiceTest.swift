//
//  MovieServiceTest.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 22/08/25.
//
import Testing
import XCTest

@testable import MyMovie

@MainActor
final class MovieServiceTest: XCTestCase {
    
    // MARK: - Success scenario
    // MARK: -
    func testGetCountMovies_2Movies_2() async {
        let movie1 = Movie(
            id: 755898,
            title: "War of the Worlds",
            overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats",
            posterPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg",
            backdropPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
        let movie2 = Movie(
            id: 575265,
            title: "Mission: Impossible - The Final Reckoning",
            overview: "Ethan Hunt and team continue their search for the terrifying AI",
            posterPath: "/z53D72EAOxGRqdr7KXXWp9dJiDe.jpg",
            backdropPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
        
        let sut: MockMovieService = MockMovieService(movies: [movie1, movie2], apiClientService: APIClientService())
        do {
            let movies = try await sut.fetchMovies()
            XCTAssertTrue(movies.count == 2)
        } catch { }
    }
    
    // MARK: - Failure scenario
    // MARK: -
    func testGet_Movies_API_FailureRsponse_WithInvalidResponseFormat() async {
        let sut = MockMovieService(movies: [], apiClientService: APIClientService(), error: APIError.invalidURL)
        do {
            _ = try await sut.fetchMovies()
        } catch {
            if let error = error as? APIError {
                XCTAssertTrue(error == APIError.invalidURL)
            }
        }
    }
}
