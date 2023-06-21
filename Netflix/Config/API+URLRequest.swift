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

    private func generateQueryItems(standards: [String : Any], params: [String : Any]?) -> [URLQueryItem]? {
        var items: [URLQueryItem] = standards.map { .init(name: $0.key, value: String(describing: $0.value)) }
        if let params = params {
            items.append(contentsOf: params.map { .init(name: $0.key, value: String(describing: $0.value)) })
        }
        return items.isEmpty ? nil : items
    }

    private func generateHeaders(standards: [String : String], headers: [String : String]?) -> [String : String]? {
        var allHeaders: [String : String] = standards
        if let headers = headers {
            allHeaders.merge(headers) { (_, new) in new }
        }
        return allHeaders
    }

    func createRequest() throws -> URLRequest {
        guard var components = URLComponents(string: domain.baseURL + "/" + path) else {
            throw APIError.invalidURL
        }

        components.queryItems = generateQueryItems(standards: domain.standardsQueryParams, params: queryParams)
        guard let url = components.url else {
            throw APIError.invalidQueryParameters
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = generateHeaders(standards: domain.standardsHeaders, headers: headers)
        return request
    }
}
