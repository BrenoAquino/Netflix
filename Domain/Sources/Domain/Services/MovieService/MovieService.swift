//
//  MovieService.swift
//  
//
//  Created by Breno Aquino on 04/07/23.
//

import Foundation

public protocol MovieService {
    /// Retrieve all clean images
    func cleanImages(movieID: Int) async throws -> Images
    /// Retrieve all images
    func images(movieID: Int) async throws -> Images
    /// Retrieve details
    func detail(movieID: Int) async throws -> MovieDetail
    /// Retrieve all informations regarding a movie
    func allContent(movieID: Int) async throws -> MovieDetail
}
