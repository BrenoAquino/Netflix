//
//  CarouselsServiceImpl.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Common
import Foundation

enum CarouselsServiceImplError: Error {
    case misconfiguration
}

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

    public func topRatedMovie() async throws -> MovieDetail {
        let topRatedMovies = try await moviesRepository.topRated(page: 1)
        guard let topRated = topRatedMovies.first else {
            throw CarouselsServiceError.emptyTopRated
        }

        var movieDetail = MovieDetail(movie: topRated)
        let genresIDs = movieDetail.genresIDs
        let movieID = movieDetail.id
        async let genresResult = try genres(ids: genresIDs)
        async let imagesResult = try moviesRepository.images(movieID: movieID)

        let result = try await [genresResult, imagesResult] as [Any]
        guard
            result.count == 2,
            let genres = result[0] as? [Genre],
            let images = result[1] as? Images
        else {
            throw CarouselsServiceImplError.misconfiguration
        }

        let supportedImages = ["png", "jpeg", "jpg"]
        let logos = images.logos.filter { $0.image.pathComponents.last?.hasSuffix(supportedImages) == true }
        let posters = images.posters.filter { $0.image.pathComponents.last?.hasSuffix(supportedImages) == true }
        let backdrops = images.backdrops.filter { $0.image.pathComponents.last?.hasSuffix(supportedImages) == true }

        movieDetail.genres = genres
        movieDetail.images = Images(
            logos: logos,
            posters: posters,
            backdrops: backdrops
        )

        return movieDetail
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

// MARK: Utils

private extension String {

    func hasSuffix(_ strings: [String]) -> Bool {
        for string in strings {
            if hasSuffix(string) {
                return true
            }
        }
        return false
    }
}
