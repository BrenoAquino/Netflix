//
//  MoviesAPIs.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

enum MoviesAPIs {
    /// Configuration related to the upcoming API
    case upcoming(_ config: DomainConfig, page: Int)
    /// Configuration related to the top rated API
    case topRated(_ config: DomainConfig, page: Int)
    /// Configuration related to the popular API
    case popular(_ config: DomainConfig, page: Int)
    /// Configuration related to the images API
    case images(_ config: DomainConfig, movieID: Int)
}
