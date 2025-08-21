//
//  ContentView.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

struct ContentView<ViewModel>: View where ViewModel: ViewModelInterface {
    @ObservedObject private var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
