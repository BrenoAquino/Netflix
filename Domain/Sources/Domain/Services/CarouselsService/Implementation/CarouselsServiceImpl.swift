//
//  CarouselsServiceImpl.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Common
import Foundation

public class CarouselsServiceImpl {

    private let moviesRepository: MoviesRepository
    private let genresRepository: GenresRepository

    public init(moviesRepository: MoviesRepository, genresRepository: GenresRepository) {
        self.moviesRepository = moviesRepository
        self.genresRepository = genresRepository
    }
}

// MARK: - Private Methods

private extension CarouselsServiceImpl {
    private func genres(ids: [Int]) async throws -> [Genre] {
        return await ids.asyncCompactMap { [weak self] in try? await self?.genresRepository.genre(id:$0) }
    }
}

// MARK: - HomeUseCase

extension CarouselsServiceImpl: CarouselsService {

    public func topRatedMovie() async throws -> Movie {
        let topRatedMovies = try await moviesRepository.topRated(page: 1)
        guard let topRated = topRatedMovies.first else {
            throw CarouselsServiceError.emptyTopRated
        }
        return topRated
    }

    public func topRated() async throws -> [Movie] {
        let movies = try await moviesRepository.topRated(page: 1)
        for var movie in movies {
            movie.genres = try await genres(ids: movie.genresIDs)
        }
        return movies
    }

    public func upcoming() async throws -> [Movie] {
        let movies = try await moviesRepository.upcoming(page: 1)
        for var movie in movies {
            movie.genres = try await genres(ids: movie.genresIDs)
        }
        return movies
    }

    public func popular() async throws -> [Movie] {
        let movies = try await moviesRepository.popular(page: 1)
        for var movie in movies {
            movie.genres = try await genres(ids: movie.genresIDs)
        }
        return movies
    }
}
