//
//  MoviesAPIs+API.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

extension GenresAPIs: API {
    var domain: DomainConfig {
        switch self {
        case .genres(let config):
            return config
        }
    }

    var path: String {
        switch self {
        case .genres:
            return "genre/movie/list"
        }
    }

    var method: RequestMethod {
        switch self {
        case .genres:
            return .get
        }
    }
}
