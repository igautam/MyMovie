//
//  MovieDetailViewModelTest.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 25/08/25.
//

import Testing
import XCTest

@testable import MyMovie

@MainActor
final class MovieDetailViewModelTest: XCTestCase {
    
    // MARK: - Success scenario
    // MARK: -
    func test_GetMovieDetail_Success() {
        let movie = Movie(
            id: 755898,
            title: "War of the Worlds",
            overview: "Will Radford is a top analyst for Homeland",
            posterPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg",
            backdropPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg"
        )
        let movieDetailService = MockMovieDetailService()
        let sut = MovieDetailViewModel(
            movie: movie,
            movieDetailService: movieDetailService
        )
        XCTAssertEqual(sut.movieTitle, "War of the Worlds")
        XCTAssertEqual(sut.movieOverView, "Will Radford is a top analyst for Homeland")
        XCTAssertNotNil(sut.movieBackdropMovieImageURL)
    }
    
    // MARK: - Failure scenario
    // MARK: -
    func test_GetMovieDetail_Failure() {
        let movie = Movie()
        let movieDetailService = MockMovieDetailService()
        let sut = MovieDetailViewModel(
            movie: movie,
            movieDetailService: movieDetailService
        )
        XCTAssertNotEqual(sut.movieTitle, "War of the Worlds")
        XCTAssertNotEqual(sut.movieOverView, "Will Radford is a top analyst for Homeland")
        XCTAssertNil(sut.movieBackdropMovieImageURL)
    }
}
