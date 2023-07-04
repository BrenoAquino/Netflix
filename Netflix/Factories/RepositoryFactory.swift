//
//  RepositoryFactory.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Data
import Domain
import Foundation

class RepositoryFactory {
    private init() {}

    private static let imageDomain = TMDBImageDomainConfig()

    static func movies() -> Domain.MoviesRepository {
        MoviesRepositoryImpl(
            imageDomain: imageDomain,
            moviesRemoteDataSource: RemoteDataSourceFactory.movies()
        )
    }

    static func genres() -> Domain.GenresRepository {
        GenresRepositoryImpl(
            genresRemoteDataSource: RemoteDataSourceFactory.genres()
        )
    }
}
