//
//  ImageCacheViewModel.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import Combine
import UIKit

@MainActor
final class ImageCacheViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var image: UIImage?
    private let imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        Task {
            try await loadImage()
        }
    }
    
    private func loadImage() async throws {
        guard let imageURL = URL(string: imageUrl) else {
            throw APIError.invalidURL
        }
        let image = try await ImageCacheManager.shared.loadImage(for: imageURL)
        self.image = image
    }
}
