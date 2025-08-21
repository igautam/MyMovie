//
//  APIClientServiceInterface.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

enum APIError: Error {
    case invalidURL
    case invalidData
    case serverError
    case unknown
}

enum HttpStatusCode: Int {
    case success = 200
    case badRequest = 400
    case unauthorized = 401
    case internalServerError = 500
}

protocol APIClientServiceInterface {
    func request<T: Decodable>(_ url: String, for type: T.Type) async throws -> T
}
