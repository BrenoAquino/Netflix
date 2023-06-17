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
    private var genres: [Genre] = []

    public init(genresRemoteDataSource: GenresRemoteDataSource) {
        self.genresRemoteDataSource = genresRemoteDataSource
    }
}

// MARK: - Domain.GenresRepository

extension GenresRepositoryImpl: Domain.GenresRepository {
    public func genres() async throws -> [Domain.Genre] {
        if !genres.isEmpty {
            return genres.map { $0.convertToDomain() }
        }
        genres = try await genresRemoteDataSource.genres()
        return genres.map { $0.convertToDomain() }
    }

    public func genre(id: Int) async throws -> Domain.Genre? {
        if let genre = genres.first(where: { $0.id == id }) {
            return genre.convertToDomain()
        }
        return try await genres().first(where: { $0.id == id })
    }
}
