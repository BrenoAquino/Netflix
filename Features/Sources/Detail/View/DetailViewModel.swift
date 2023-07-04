//
//  DetailViewModel.swift
//  
//
//  Created by Breno Aquino on 04/07/23.
//

import Domain
import Foundation

enum DetailState {
    case loading
    case content
    case error
}

public class DetailViewModel: ObservableObject {

    // MARK: Variables

    private let movieID: Int
    private let movieService: Domain.MovieService

    // MARK: Publishers

    @Published private(set) var movie: MovieDetailUI?
    @Published private(set) var state: DetailState = .loading

    // MARK: Inits

    public init(movieService: Domain.MovieService, movie: Domain.MovieDetail) {
        self.movieService = movieService
        self.movieID = movie.id
        self.movie = MovieDetailUI(movie: movie)
    }

    public init(movieService: Domain.MovieService, movieID: Int) {
        self.movieService = movieService
        self.movieID = movieID
    }
}

// MARK: - Private Methods

extension DetailViewModel {

    @Sendable func fetchMovie() async {
        guard movie == nil else {
            state = .error
            return
        }

        do {
            let content = try await movieService.allContent(movieID: movieID)
            movie = MovieDetailUI(movie: content)
            state = .content
        } catch {
            Logger.log(level: .error, "\(String(describing: error)) | \(error.localizedDescription)")
            state = .error
        }
    }
}
