//
//  MovieDetailViewModel.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import SwiftUI

@MainActor
class MovieDetailViewModel: ViewModelInterface {
    private let movieService: MovieDetailServiceInterface
    @Published var state: DataLoadingState = .idle

    init(movieService: MovieDetailServiceInterface) {
        self.movieService = movieService
    }
    
    func loadData() async throws {
    }
}
