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

    static func movies() -> Domain.MoviesRepository {
        MoviesRepositoryImpl(
            moviesRemoteDataSource: RemoteDataSourceFactory.movies()
        )
    }

    static func genres() -> Domain.GenresRepository {
        GenresRepositoryImpl(
            genresRemoteDataSource: RemoteDataSourceFactory.genres()
        )
    }
}
