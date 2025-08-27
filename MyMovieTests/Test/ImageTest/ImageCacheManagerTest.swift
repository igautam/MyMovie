//
//  ImageCacheManagerTest.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import XCTest
import Foundation

@testable import MyMovie

class ImageCacheManagerTests: XCTestCase {

    var sut: ImageCacheManager?
    
    override func setUpWithError() throws {
        sut = ImageCacheManager.shared
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    // MARK: - Success scenario
    // MARK: -
    func testImageCached_Success() async {
        guard let testURL = URL(string: "https://image.tmdb.org/t/p/w154/yvirUYrva23IudARHn3mMGVxWqM.jpg") else {
            return
        }
        do {
            let image = try await sut?.loadImage(for: testURL)
            XCTAssertNotNil(image)
            
            if let image = image {
                sut?.cacheImage(image, for: testURL)
            }
            let cachedImage = sut?.getCachedImage(for: testURL)
            XCTAssertNotNil(cachedImage)
        } catch let error {
            XCTAssertNotNil(error)
            XCTFail("Failed to download image")
        }
    }
    
    // MARK: - Failure scenario
    // MARK: -
    func testImageCached_Failure() async {
        guard let testURL = URL(string: "https://image.tmdb.org/t/p/w154/yvirUYrva23IudARHn3mMGVxWqM") else {
            return
        }
        do {
            let image = try await sut?.loadImage(for: testURL)
            XCTAssertNotNil(image)
            
            if let image = image {
                sut?.cacheImage(image, for: testURL)
            }
            let cachedImage = sut?.getCachedImage(for: testURL)
            XCTAssertNotNil(cachedImage)
        } catch let error {
            XCTAssertNotNil(error)
        }
    }
}
