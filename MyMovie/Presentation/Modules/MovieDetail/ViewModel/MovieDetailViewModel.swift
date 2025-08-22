//
//  MovieDetailViewModel.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import SwiftUI

@MainActor
class MovieDetailViewModel: ObservableObject {
    private let movieDetailService: MovieDetailServiceInterface
    @Published var state: DataLoadingState = .idle

    init(movieDetailService: MovieDetailServiceInterface) {
        self.movieDetailService = movieDetailService
    }
    
    enum DataLoadingState {
        case idle
        case loading
        case loaded([Movie])
        case error(Error)
    }

    func loadData() async throws { }
}
