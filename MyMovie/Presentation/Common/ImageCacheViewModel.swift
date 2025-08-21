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
class ImageCacheViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var image: UIImage? = nil
    let imageUrlStr:String?
    
    init(imageUrlStr: String?) {
        self.imageUrlStr = imageUrlStr
        Task {
            try await loadImage()
        }
    }
    
    func loadImage() async throws {
        guard let imageURL = URL(string: imageUrlStr ?? "") else { return }
        let image = try await ImageCacheManager.shared.loadImage(for: imageURL)
        self.image = image
    }
}
