//
//  MovieDetailCoordinatorTest.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 26/08/25.
//

import Testing
import XCTest

@testable import MyMovie

@MainActor
final class MovieDetailCoordinatorTest: XCTestCase {
    
    func testNavigation_BuildView() {
        let movie = Movie(
            id: 755898,
            title: "War of the Worlds",
            overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats",
            posterPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
        let coordinator = MovieDetailCoordinator(
            movie: movie,
            router: Router(),
            configuration: Configuration(apiClientService: APIClientService()))
        let view = coordinator.build()
        XCTAssertNotNil(view)
    }
}
