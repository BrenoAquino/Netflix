//
//  URLSessionNetworkProvider.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Common
import Data
import Foundation

extension URLSessionNetworkProvider {

    enum NetworkError: Error {
        case serverInstability
        case badRequest
        case invalidResponse
    }
}

class URLSessionNetworkProvider {
    private let session: URLSession

    // MARK: Init
    init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - Utils

extension URLSessionNetworkProvider {

    private func extract(data: Data, keyPath: String?) -> Data {
        guard let keyPath,
              let json = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary,
              let result = json.value(forKeyPath: keyPath),
              let nestedJson = try? JSONSerialization.data(withJSONObject: result)
        else {
            return data
        }
        return nestedJson
    }
}

// MARK: - NetworkProvider

extension URLSessionNetworkProvider: NetworkProvider {

    func execute<Model: Decodable>(endpoint: API, keyPath: String?) async throws -> Model {
        let request = try endpoint.createRequest()
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 200...299:
            let dataModel = extract(data: data, keyPath: keyPath)
            let model = try JSONDecoder().decode(Model.self, from: dataModel)
            return model
        case 400:
            throw NetworkError.badRequest
        default:
            throw NetworkError.serverInstability
        }
    }
}
