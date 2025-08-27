//
//  ImageCacheManager.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import UIKit

final class ImageCacheManager {
    static var shared = ImageCacheManager()
    private var cache = NSCache<NSString, UIImage>()
    
    func loadImage(for url: URL) async throws -> UIImage {
        if let cachedImage = self.getCachedImage(for: url) {
            return cachedImage
        }
        let (data, response) = try await URLSession.shared.data(from: url, delegate: nil)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == HttpStatusCode.success.rawValue
        else {
            throw APIError.invalidURL
        }
        guard let image = UIImage(data: data) else {
            throw APIError.invalidData
        }
        self.cacheImage(image, for: url)
        return image
    }
    
    func cacheImage(_ image: UIImage, for url: URL) {
        self.cache.setObject(image, forKey: NSString(string: url.absoluteString))
    }
    
    func getCachedImage(for url: URL) -> UIImage? {
        self.cache.object(forKey: NSString(string: url.absoluteString))
    }
}
