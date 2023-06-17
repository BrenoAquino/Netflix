//
//  MoviesRepository.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public protocol MoviesRepository {
    /// Get upcoming movies
    func upcoming(page: Int) async throws -> [Movie]
    /// Get top rated movies
    func topRated(page: Int) async throws -> [Movie]
    /// Get popular movies
    func popular(page: Int) async throws -> [Movie]
}