//
//  CarouselsService.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public protocol CarouselsService {
    /// Get highlighted movie
    func highlighted() async throws -> [MovieDetail]
    /// Get top rated movies
    func topRated() async throws -> [Movie]
    /// Get upcoming movies
    func upcoming() async throws -> [Movie]
    /// Get popular movies
    func popular() async throws -> [Movie]
}
