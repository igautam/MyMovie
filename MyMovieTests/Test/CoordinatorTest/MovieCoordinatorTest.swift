//
//  MovieCoordinatorTest.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 22/08/25.
//

import Testing
import XCTest

@testable import MyMovie

@MainActor
final class MovieCoordinatorTest: XCTestCase {
    
    func testGetCountNavigation_1NavigationPush_1() {
        let coordinator = MovieCoordinator(
            router: Router(),
            configuration: Configuration(apiClientService: APIClientService()))
        let movie = Movie(
            id: 755898,
            title: "War of the Worlds",
            overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats",
            posterPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
        
        coordinator.showMovieDetail(movie: movie)
        let navigationCount = coordinator.getNavigationCount()
        XCTAssertTrue(navigationCount == 1)
    }
    
    func testGetCountNavigation_BackNavigation() {
        let coordinator = MovieCoordinator(
            router: Router(),
            configuration: Configuration(apiClientService: APIClientService()))
        let movie = Movie(
            id: 755898,
            title: "War of the Worlds",
            overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats",
            posterPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
        
        coordinator.showMovieDetail(movie: movie)
        coordinator.navigateBack()
        let navigationCount = coordinator.getNavigationCount()
        
        XCTAssertTrue(navigationCount == 0)
    }
    
    func testNavigation_BuildView() {
        let coordinator = MovieCoordinator(
            router: Router(),
            configuration: Configuration(apiClientService: APIClientService()))
        let view = coordinator.build()
        XCTAssertNotNil(view)
    }
}
