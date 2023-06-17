//
//  GenresRemoteDataSource.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public protocol GenresRemoteDataSource {
    /// Retrieve the movies genres
    func genres() async throws -> [Genre]
}
