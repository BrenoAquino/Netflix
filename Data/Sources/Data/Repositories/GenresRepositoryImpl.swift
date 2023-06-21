//
//  GenresRepositoryImpl.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Domain
import Foundation

public class GenresRepositoryImpl {

    private let genresRemoteDataSource: GenresRemoteDataSource
    private var genres: [Domain.Genre] = []

    public init(genresRemoteDataSource: GenresRemoteDataSource) {
        self.genresRemoteDataSource = genresRemoteDataSource
    }
}

// MARK: - Domain.GenresRepository

extension GenresRepositoryImpl: Domain.GenresRepository {
    public func genres() async throws -> [Domain.Genre] {
        if !genres.isEmpty {
            return genres
        }
        genres = try await genresRemoteDataSource.genres().compactMap { $0.convertToDomain() }
        return genres
    }

    public func genre(id: Int) async throws -> Domain.Genre? {
        if let genre = genres.first(where: { $0.id == id }) {
            return genre
        }
        return try await genres().first(where: { $0.id == id })
    }
}
