//
//  MovieDetailUI.swift
//  
//
//  Created by Breno Aquino on 20/06/23.
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

        let portrait = AspectDesignConstant.portrait.widthDividedByHeight
        let posters = movie.images.posters.sortedByVoteAverage()
        posterURL = posters.findBestImage(aspectRationComparative: .closest(aspectRation: portrait))?.image
        let cleanPosters = movie.cleanImages.posters.sortedByVoteAverage()
        cleanPosterURL = cleanPosters.findBestImage(aspectRationComparative: .closest(aspectRation: portrait))?.image
        Logger.log(cleanPosterURL?.absoluteString)

        let landscape = AspectDesignConstant.landscape.widthDividedByHeight
        let backdrops = movie.images.backdrops.sortedByVoteAverage()
        backdropURL = backdrops.findBestImage(aspectRationComparative: .closest(aspectRation: landscape))?.image
        let cleanBackdrops = movie.cleanImages.backdrops.sortedByVoteAverage()
        cleanBackdropURL = cleanBackdrops.findBestImage(aspectRationComparative: .closest(aspectRation: landscape))?.image
    }
}

extension MovieDetailUI: Identifiable {}

private extension Array where Element == Image {

    func sortedByVoteAverage() -> Self {
        sorted(by: { $0.voteAverage < $1.voteAverage })
    }

    enum AspectRationComparative {
        case closest(aspectRation: Double)
        case highest
        case lowest
    }

    func findBestImage(aspectRationComparative: AspectRationComparative, rangeOffset: Double = 0.1) -> Element? {
        switch aspectRationComparative {
        case .highest:
            return findByCondition {
                $0.aspectRation + rangeOffset < $1.aspectRation
            }
        case .lowest:
            return findByCondition {
                $0.aspectRation - rangeOffset > $1.aspectRation
            }
        case .closest(let aspectRation):
            return findByCondition {
                abs($0.aspectRation - aspectRation) + rangeOffset < abs($1.aspectRation - aspectRation)
            }
        }
    }

    private func findByCondition(
        _ condition: @escaping (_ currentResult: Element, _ element: Element) -> Bool
    ) -> Element? {
        guard var result = first else { return nil }
        for element in self {
            if condition(result, element) {
                result = element
            }
        }
        return result
    }
}
