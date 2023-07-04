//
//  MovieServiceImpl.swift
//  
//
//  Created by Breno Aquino on 04/07/23.
//

import Foundation

class MovieServiceImpl {

    // MARK: Variables

    private let moviesRepository: MoviesRepository

    // MARK: Inits

    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
}

// MARK: - MovieService

extension MovieServiceImpl: MovieService {
    func cleanImages(movieID: Int) async throws -> Images {
        try await moviesRepository.cleanImages(movieID: movieID)
    }

    func images(movieID: Int) async throws -> Images {
        try await moviesRepository.images(movieID: movieID)
    }

    func detail(movieID: Int) async throws -> MovieDetail {
        try await moviesRepository.detail(movieID: movieID)
    }

    func allContent(movieID: Int) async throws -> MovieDetail {
        async let detailRetriever = detail(movieID: movieID)
        async let imagesRetriever = images(movieID: movieID)
        async let cleanImagesRetriever = cleanImages(movieID: movieID)

        var (detail, images, cleanImages) = try await (detailRetriever, imagesRetriever, cleanImagesRetriever)
        detail.images = images
        detail.cleanImages = cleanImages
        return detail
    }
}
