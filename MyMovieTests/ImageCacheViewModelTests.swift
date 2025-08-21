//
//  ImageCachingTest.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import XCTest
import Foundation

@testable import MyMovie

class ImageCacheViewModelTests: XCTestCase {

    var sut: MockImageCacheViewModel?
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Success scenario
    // MARK: -
    func testImageDownload_Success() async {
        let testURLString = "https://image.tmdb.org/t/p/w154/yvirUYrva23IudARHn3mMGVxWqM.jpg"
        sut = MockImageCacheViewModel(imageUrlStr: testURLString)
        do {
            try await sut?.loadImage()
            XCTAssertNotNil(sut?.image)
            
////            if let image = image {
////                sut?.cacheImage(image, for: testImageURL)
////            }
////            let cachedImage = sut?.getCachedImage(for: testImageURL)
//            XCTAssertNotNil(cachedImage, "error while fetching image from cache")
        } catch let error {
            XCTAssertNotNil(error, "No error while downloading image")
            XCTFail("Failed to download image")
        }
    }
    
    // MARK: - Failure scenario
    // MARK: -
    // Bad URL for image for testing bad request for image downloading.
    func testImageDownload_Failure() async {
        let testURLString = "https://image.tmdb.org/t/p/w154/yvirUYrva23IudARHn3mMGVxWqM"
        sut = MockImageCacheViewModel(imageUrlStr: testURLString)
        do {
            try await sut?.loadImage()
            XCTAssertNotNil(sut?.image)
        } catch let error {
            XCTAssertNotNil(error, "No error while downloading image")
            if let error = error as? APIError {
                XCTAssertEqual(error, APIError.invalidURL)
            }
        }
    }

    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
