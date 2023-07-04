//
//  MovieDetailUI.swift
//  
//
//  Created by Breno Aquino on 04/07/23.
//

import Domain
import DesignSystem
import Foundation

class MovieDetailUI {

    /// Movie ID
    let id: Int
    /// Title
    let title: String
    /// Categories
    let genres: [GenreUI]
    /// Portrait poster
    let posterURL: URL?
    /// Clean portrait poster
    let cleanPosterURL: URL?
    /// Backdrop image
    let backdropURL: URL?
    /// Clean backdrop image
    let cleanBackdropURL: URL?
    /// Logo image
    let logoURL: URL?

    /// Categories joined
    var genresJoined: String {
        genres.map { $0.name }.joined(separator: " • ")
    }

    init(
        id: Int,
        title: String,
        genres: [GenreUI],
        posterURL: URL?,
        cleanPosterURL: URL?,
        backdropURL: URL?,
        cleanBackdropURL: URL?,
        logoURL: URL?
    ) {
        self.id = id
        self.title = title
        self.genres = genres
        self.posterURL = posterURL
        self.cleanPosterURL = cleanPosterURL
        self.backdropURL = backdropURL
        self.cleanBackdropURL = cleanBackdropURL
        self.logoURL = logoURL
    }

    init(movie: Domain.MovieDetail) {
        id = movie.id
        title = movie.title
        genres = movie.genres.map { GenreUI(genre: $0) }

        let logos = movie.images.logos.sortedByVoteAverage()
        logoURL = logos.findBestImage(aspectRationComparative: .highest)?.image

        let portrait = DSAspectRatio.portrait.widthDividedByHeight
        let posters = movie.images.posters.sortedByVoteAverage()
        posterURL = posters.findBestImage(aspectRationComparative: .closest(aspectRation: portrait))?.image
        let cleanPosters = movie.cleanImages.posters.sortedByVoteAverage()
        cleanPosterURL = cleanPosters.findBestImage(aspectRationComparative: .closest(aspectRation: portrait))?.image

        let landscape = DSAspectRatio.landscape.widthDividedByHeight
        let backdrops = movie.images.backdrops.sortedByVoteAverage()
        backdropURL = backdrops.findBestImage(aspectRationComparative: .closest(aspectRation: landscape))?.image
        let cleanBackdrops = movie.cleanImages.backdrops.sortedByVoteAverage()
        cleanBackdropURL = cleanBackdrops.findBestImage(aspectRationComparative: .closest(aspectRation: landscape))?.image
    }
}

extension MovieDetailUI: Identifiable {}
