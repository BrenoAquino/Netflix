//
//  MoviesRepositoryImpl.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation
import Domain

enum MoviesRepositoryImplError: Error {
    case unableToConvert(origin: String)
}

public class MoviesRepositoryImpl {

    private let moviesRemoteDataSource: MoviesRemoteDataSource
    private let imageDomain: ImageDomainConfig?

    public init(imageDomain: ImageDomainConfig? = nil, moviesRemoteDataSource: MoviesRemoteDataSource) {
        self.imageDomain = imageDomain
        self.moviesRemoteDataSource = moviesRemoteDataSource
    }
}

// MARK: - Domain.MoviesRepository

extension MoviesRepositoryImpl: Domain.MoviesRepository {

    public func upcoming(page: Int) async throws -> [Domain.Movie] {
        let movies = try await moviesRemoteDataSource.upcoming(page: page)
        return movies.results.compactMap { $0.convertToDomain(imageDomain) }
    }

    public func topRated(page: Int) async throws -> [Domain.Movie] {
        let movies = try await moviesRemoteDataSource.topRated(page: page)
        return movies.results.compactMap { $0.convertToDomain(imageDomain) }
    }

    public func popular(page: Int) async throws -> [Domain.Movie] {
        let movies = try await moviesRemoteDataSource.popular(page: page)
        return movies.results.compactMap { $0.convertToDomain(imageDomain) }
    }

    public func images(movieID: Int) async throws -> Domain.Images {
        let images = try await moviesRemoteDataSource.images(movieID: movieID)
        return images.convertToDomain(imageDomain)
    }

    public func detail(movieID: Int) async throws -> Domain.MovieDetail {
        let detail = try await moviesRemoteDataSource.detail(movieID: movieID)
        guard let detailDomain = detail.convertToDomain(imageDomain) else {
            let originDescription = String(describing: detail)
            throw MoviesRepositoryImplError.unableToConvert(origin: originDescription)
        }
        return detailDomain
    }
}
