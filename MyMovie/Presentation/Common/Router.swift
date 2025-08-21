//
//  Router.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import SwiftUI

public final class Router: ObservableObject {
    @Published public var navPath = NavigationPath()

    public init() {}

    public func navigate(to destination: any Hashable) {
        navPath.append(destination)
    }

    public func navigateBack() {
        navPath.removeLast()
    }
}
