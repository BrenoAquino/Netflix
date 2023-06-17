//
//  API+URLRequest.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Data
import Foundation

enum APIError: Error {
    case invalidURL
    case invalidQueryParameters
}

extension API {

    private func generateQueryItems(params: [String : Any]?, additional: [String : Any]) -> [URLQueryItem]? {
        var items: [URLQueryItem] = []
        if let params = params {
            for (key, value) in params {
                items.append(.init(name: key, value: String(describing: value)))
            }
        }
        for (key, value) in additional {
            items.append(.init(name: key, value: String(describing: value)))
        }
        return items.isEmpty ? nil : items
    }

    private func generateHeaders(headers: [String : String]?, additional: [String : String]) -> [String : String]? {
        var allHeaders: [String : String] = [:]
        if let headers = headers {
            allHeaders = headers
            allHeaders.merge(additional) { (_, new) in new }
        } else {
            allHeaders = additional
        }
        return allHeaders
    }

    private func generateQueryItems(params: [String: Any]?) -> [URLQueryItem]? {
        var items: [URLQueryItem] = []

        if let params = params {
            for (key, value) in params {
                items.append(
                    .init(name: key, value: String(describing: value))
                )
            }
        }

        return items.isEmpty ? nil : items
    }

    func createRequest() throws -> URLRequest {
        guard var components = URLComponents(string: domain.baseURL + "/" + path) else {
            throw APIError.invalidURL
        }

        components.queryItems = generateQueryItems(params: queryParams, additional: domain.additionalQueryParams)
        guard let url = components.url else {
            throw APIError.invalidQueryParameters
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = generateHeaders(headers: headers, additional: domain.additionalHeaders)
        return request
    }
}
