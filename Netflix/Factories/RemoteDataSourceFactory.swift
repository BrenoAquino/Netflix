//
//  RemoteDataSourceFactory.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Data
import Foundation

class RemoteDataSourceFactory {
    private init() {}

    private static let networkProvider: NetworkProvider = URLSessionNetworkProvider()
    private static let domain: DomainConfig = TMDBConfig()

    static func movies() -> MoviesRemoteDataSource {
        MoviesRemoteDataSourceImpl(
            provider: networkProvider,
            domain: domain
        )
    }

    static func genres() -> GenresRemoteDataSource {
        GenresRemoteDataSourceImpl(
            provider: networkProvider,
            domain: domain
        )
    }
}
