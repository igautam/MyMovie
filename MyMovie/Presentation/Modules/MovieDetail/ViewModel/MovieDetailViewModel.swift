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
    private let movieDetailService: MovieDetailServiceInterface
    @Published var state: DataLoadingState = .idle

    init(movieDetailService: MovieDetailServiceInterface) {
        self.movieDetailService = movieDetailService
    }
    
    func loadData() async throws {
        //TODO: Fetch geners data through movieDetailService
    }
}
