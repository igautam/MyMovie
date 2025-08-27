//
//  MockImageCacheViewModel.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//
import Foundation
import SwiftUI

@testable import MyMovie

class MockImageCacheViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var image: UIImage?
    private let imageUrl: String?
    
    init(imageUrl: String?) {
        self.imageUrl = imageUrl
        Task {
            try await loadImage()
        }
    }
    
    func loadImage() async throws {
        guard let imageURL = URL(string: imageUrl ?? "") else { return }
        let image = try await ImageCacheManager.shared.loadImage(for: imageURL)
        self.image = image
    }
}
