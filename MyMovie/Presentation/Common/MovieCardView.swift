//
//  MovieCardView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//
import SwiftUI

struct MovieCardView: View {
    private var movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }

    public var body: some View {
        VStack {
            ImageView(imageUrlStr: movie.movieImageURL)
                .frame(width: 128, height: 185)
                .cornerRadius(4)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
            HStack(spacing: 0) {
                Text(movie.title ?? "")
                    .lineLimit(2)
                    .font(.system(size: 13, weight: .semibold))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 128)
    }
}
