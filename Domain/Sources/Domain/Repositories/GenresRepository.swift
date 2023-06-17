//
//  GenresRepository.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public protocol GenresRepository {
    /// Get all available genres
    func genres() async throws -> [Genre]
    /// Get a specific genre
    func genre(id: Int) async throws -> Genre?
}
