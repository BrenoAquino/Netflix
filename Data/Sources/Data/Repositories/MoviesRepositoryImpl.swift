//
//  MoviesRepositoryImpl.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation
import Domain

public class MoviesRepositoryImpl {

    private let moviesRemoteDataSource: MoviesRemoteDataSource

    public init(moviesRemoteDataSource: MoviesRemoteDataSource) {
        self.moviesRemoteDataSource = moviesRemoteDataSource
    }
}

// MARK: - Domain.MoviesRepository

extension MoviesRepositoryImpl: Domain.MoviesRepository {

    public func upcoming(page: Int) async throws -> [Domain.Movie] {
        let movies = try await moviesRemoteDataSource.upcoming(page: page)
        return movies.results.map { $0.convertToDomain() }
    }

    public func topRated(page: Int) async throws -> [Domain.Movie] {
        let movies = try await moviesRemoteDataSource.topRated(page: page)
        return movies.results.map { $0.convertToDomain() }
    }

    public func popular(page: Int) async throws -> [Domain.Movie] {
        let movies = try await moviesRemoteDataSource.popular(page: page)
        return movies.results.map { $0.convertToDomain() }
    }
}
