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
        case .upcoming(let config, _),
             .popular(let config, _),
             .topRated(let config, _),
             .images(let config, _),
             .cleanImages(let config, _),
             .detail(let config, _):
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
        case .images(_, let movieID), .cleanImages(_, let movieID):
            return "movie/\(movieID)/images"
        case .detail(_, let movieID):
            return "movie/\(movieID)"
        }
    }

    var method: RequestMethod {
        switch self {
        case .upcoming, .popular, .topRated, .images, .cleanImages, .detail:
            return .get
        }
    }

    var queryParams: [String : Any]? {
        switch self {
        case .upcoming(_, let page), .popular(_, let page), .topRated(_, let page):
            return ["page": page]
        case .cleanImages:
            return ["language": "xx"]
        case .images, .detail:
            return nil
        }
    }
}
