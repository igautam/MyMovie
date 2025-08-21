//
//  MovieViewModelTest.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Testing
import XCTest
import Combine
@testable import MyMovie


@MainActor
final class MovieViewModelTest: XCTestCase {
    var sut: MockMovieViewModel?
    var cancellable = Set<AnyCancellable>()
    var movies: [Movie] = []
    
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Success scenario
    // MARK: -
    func testGetCountMovies_2Movies_2() async {
        let movie1 = Movie(id: 755898, title: "War of the Worlds_1",  overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats", poster_path: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
        let movie2 = Movie(id: 575265, title: "Mission: Impossible - The Final Reckoning",  overview: "Ethan Hunt and team continue their search for the terrifying AI known as the Entity — which has infiltrated intelligence networks all over the globe — wit", poster_path: "/z53D72EAOxGRqdr7KXXWp9dJiDe.jpg")
        
        let service = MockMovieService(movies: [movie1, movie2], apiClientService: APIClientService())
        sut = MockMovieViewModel(movieService: service)
        do {
            try await sut?.loadData()
            if case let .loaded(movies) = sut?.state {
                XCTAssertTrue(movies.count == 2)
            }
        } catch {
            
        }
    }

    
    // MARK: - Failure scenario
    // MARK: -
    func testGet_Movies_API_FailureRsponse_WithInvalidResponseFormat() async {
        let service = MockMovieService(movies: [], apiClientService: APIClientService(), error: APIError.invalidURL)
        sut = MockMovieViewModel(movieService: service)
        do {
            try await sut?.loadData()
        } catch {
            XCTAssertTrue(error as! APIError == APIError.invalidURL)
        }
    }
}
