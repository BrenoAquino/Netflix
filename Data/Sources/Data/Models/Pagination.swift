//
//  Pagination.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public struct Pagination<T: Decodable>: Decodable {

    let page: Int
    let totalPages: Int
    let totalResults: Int
    let results: T

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
