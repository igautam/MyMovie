//
//  ViewModelInterface.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation
import SwiftUI

@MainActor
protocol ViewModelInterface: ObservableObject {
    func loadData() async throws
    var state: DataLoadingState { get set }
}

enum DataLoadingState {
    case idle
    case loading
    case loaded([Movie])
    case error(Error)
}
