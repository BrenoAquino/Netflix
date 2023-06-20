//
//  CarouselsService.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public enum CarouselsServiceError: Error {
    /// Missing a top rated movie
    case emptyTopRated
}

public protocol CarouselsService {
    /// Get top rated movie
    func topRatedMovie() async throws -> Movie
    /// Get top rated movies
    func topRated() async throws -> [Movie]
    /// Get upcoming movies
    func upcoming() async throws -> [Movie]
    /// Get popular movies
    func popular() async throws -> [Movie]
}
