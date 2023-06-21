//
//  File.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public class MoviesRemoteDataSourceImpl {
    private let provider: NetworkProvider
    private let domain: DomainConfig

    public init(provider: NetworkProvider, domain: DomainConfig) {
        self.provider = provider
        self.domain = domain
    }
}

// MARK: - MoviesRemoteDataSource

extension MoviesRemoteDataSourceImpl: MoviesRemoteDataSource {
    public func upcoming(page: Int) async throws -> Pagination<[Movie]> {
        let api = MoviesAPIs.upcoming(domain, page: page)
        return try await provider.execute(endpoint: api, keyPath: nil)
    }

    public func topRated(page: Int) async throws -> Pagination<[Movie]> {
        let api = MoviesAPIs.topRated(domain, page: page)
        return try await provider.execute(endpoint: api, keyPath: nil)
    }

    public func popular(page: Int) async throws -> Pagination<[Movie]> {
        let api = MoviesAPIs.popular(domain, page: page)
        return try await provider.execute(endpoint: api, keyPath: nil)
    }

    public func images(movieID: Int) async throws -> Images {
        let api = MoviesAPIs.images(domain, movieID: movieID)
        return try await provider.execute(endpoint: api, keyPath: nil)
    }
}
