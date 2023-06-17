//
//  GenresRemoteDataSourceImpl.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation

public class GenresRemoteDataSourceImpl {
    private let provider: NetworkProvider
    private let domain: DomainConfig

    public init(provider: NetworkProvider, domain: DomainConfig) {
        self.provider = provider
        self.domain = domain
    }
}

// MARK: - MoviesRemoteDataSource

extension GenresRemoteDataSourceImpl: GenresRemoteDataSource {
    public func genres() async throws -> [Genre] {
        let api = GenresAPIs.genres(domain)
        return try await provider.execute(endpoint: api, keyPath: "genres")
    }
}
