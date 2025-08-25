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
final class CoordinatorTest: XCTestCase {
    
    func testGetCountNavigation_1NavigationPush_1() {
        let coordinator = Coordinator()
        let movie = Movie(
            id: 755898,
            title: "War of the Worlds",
            overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats",
            posterPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
        coordinator.navigate(to: Destination.movieDetail(movie: movie))
        
        XCTAssertTrue(coordinator.navPath.count == 1)
    }
    
    func testGetCountNavigation_BackNavigation() {
        let coordinator = Coordinator()
        let movie = Movie(
            id: 755898,
            title: "War of the Worlds",
            overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats",
            posterPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
        coordinator.navigate(to: Destination.movieDetail(movie: movie))
        coordinator.navigateBack()
        
        XCTAssertTrue(coordinator.navPath.count == 0)
    }
    
    func testNavigation_BuildView() {
        let coordinator = Coordinator()
        let movie = Movie(
            id: 755898,
            title: "War of the Worlds",
            overview: "Will Radford is a top analyst for Homeland Security who tracks potential threats",
            posterPath: "/yvirUYrva23IudARHn3mMGVxWqM.jpg")
        let destination = Destination.movieDetail(movie: movie)
        coordinator.navigate(to: Destination.movieDetail(movie: movie))
        let view = coordinator.buildView(
            for: destination,
            configuration: Configuration(
                apiClientService: APIClientService()
            )
        )
        XCTAssertNotNil(view)
    }
}
