//
//  File.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public protocol MoviesRemoteDataSource {
    /// Retrieve the upcoming movies
    func upcoming(page: Int) async throws -> Pagination<[Movie]>
    /// Retrieve the top rated movies
    func topRated(page: Int) async throws -> Pagination<[Movie]>
    /// Retrieve the popular movies
    func popular(page: Int) async throws -> Pagination<[Movie]>
    /// Retrieve all images related to a specific movie
    func images(movieID: Int) async throws -> Images
}
