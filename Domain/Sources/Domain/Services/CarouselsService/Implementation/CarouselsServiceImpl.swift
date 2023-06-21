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
    case emptyHighlighted
}

private enum CarouselsServiceImplConstants {
    static let highlightedCount: Int = 3
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

    private func movie(id: Int) async throws -> MovieDetail {
        async let detailRetriever = self.moviesRepository.detail(movieID: id)
        async let imagesRetriever = self.moviesRepository.images(movieID: id)
        async let cleanImagesRetriever = self.moviesRepository.cleanImages(movieID: id)

        var (detail, images, cleanImages) = try await (detailRetriever, imagesRetriever, cleanImagesRetriever)
        detail.images = images
        detail.cleanImages = cleanImages
        return detail
    }
}

// MARK: - HomeUseCase

extension CarouselsServiceImpl: CarouselsService {

    public func highlighted() async throws -> [MovieDetail] {
        // Get highlighted IDs (top upcoming movies)
        let upcomingMovies = try await moviesRepository.upcoming(page: 1)
        let topUpcomingMovies = Array(upcomingMovies.prefix(CarouselsServiceImplConstants.highlightedCount))
        guard !topUpcomingMovies.isEmpty else {
            throw CarouselsServiceImplError.emptyHighlighted
        }

        // Getting movies details and images
        let ids = topUpcomingMovies.map { $0.id }
        return try await withThrowingTaskGroup(of: MovieDetail?.self, returning: [MovieDetail].self) { [weak self] taskGroup in
            for id in ids {
                taskGroup.addTask { [weak self] in try await self?.movie(id: id) }
            }

            var allDetails: [MovieDetail] = []
            for try await result in taskGroup {
                if let result {
                    allDetails.append(result)
                }
            }
            return allDetails
        }
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
        let upComingTotal = max(movies.count - CarouselsServiceImplConstants.highlightedCount, .zero)
        return movies.suffix(upComingTotal)
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
