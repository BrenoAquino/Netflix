//
//  MoviesAPIs+API.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

extension MoviesAPIs: API {
    var domain: DomainConfig {
        switch self {
        case .upcoming(let config, _), .popular(let config, _), .topRated(let config, _):
            return config
        }
    }

    var path: String {
        switch self {
        case .upcoming:
            return "movie/upcoming"
        case .topRated:
            return "movie/top_rated"
        case .popular:
            return "movie/popular"
        }
    }

    var method: RequestMethod {
        switch self {
        case .upcoming, .popular, .topRated:
            return .get
        }
    }

    var queryParams: [String : Any]? {
        switch self {
        case .upcoming(_, let page), .popular(_, let page), .topRated(_, let page):
            return ["page": page]
        }
    }
}
