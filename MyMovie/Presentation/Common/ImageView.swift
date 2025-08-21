//
//  ImageView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import SwiftUI

struct ImageView: View {
    @StateObject private var loader:ImageCacheViewModel
    
    init(imageUrlStr: String?) {
        _loader = StateObject(wrappedValue: ImageCacheViewModel(imageUrlStr: imageUrlStr))
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
