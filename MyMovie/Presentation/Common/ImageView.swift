//
//  ImageView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import SwiftUI

struct ImageView: View {
    @StateObject private var loader: ImageCacheViewModel
    
    init(imageUrl: String) {
        _loader = StateObject(wrappedValue: ImageCacheViewModel(imageUrl: imageUrl))
    }
    
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}
