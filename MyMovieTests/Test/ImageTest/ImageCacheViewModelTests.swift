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
}
