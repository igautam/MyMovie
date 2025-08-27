//
//  APIClientService.swift
//  MyMovie
//
//  Created by Rajesh Kumar on 21/08/25.
//

import Foundation

final class APIClientService: APIClientServiceInterface {
    func request<T>(_ urlString: String, for type: T.Type) async throws -> T where T: Decodable {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let jsonResponse = try? JSONDecoder()
            .decode(T.self, from: data),
              (response as? HTTPURLResponse)?.statusCode == HttpStatusCode.success.rawValue else {
            throw APIError.invalidData
        }
        return jsonResponse
    }
}
