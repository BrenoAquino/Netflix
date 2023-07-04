//
//  ServiceFactory.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Domain
import Foundation

class ServiceFactory {
    private init() {}

    static func carousels() -> Domain.CarouselsService {
        Domain.CarouselsServiceImpl(
            moviesRepository: RepositoryFactory.movies(),
            genresRepository: RepositoryFactory.genres()
        )
    }

    static func movie() -> Domain.MovieService {
        Domain.MovieServiceImpl(
            moviesRepository: RepositoryFactory.movies()
        )
    }
}
