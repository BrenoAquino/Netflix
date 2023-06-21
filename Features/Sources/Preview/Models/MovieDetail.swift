//
//  File.swift
//  
//
//  Created by Breno Aquino on 20/06/23.
//

#if DEBUG
import Domain
import Foundation

private extension Domain.MovieDetail {
    init(
        id: Int,
        title: String,
        poster: URL,
        genresIDs: [Int],
        voteAverage: Double,
        genres: [Genre],
        images: Images
    ) {
        self.init(id: id, title: title, poster: poster, genresIDs: genres.map { $0.id }, voteAverage: voteAverage)
        self.genres = genres
        self.images = images
    }
}

extension Domain.MovieDetail {
    public static let marioBros: MovieDetail = .init(
        id: 1,
        title: "Super Mario Bros.: The Film \(arc4random() % 100)",
        poster: URL(string: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/ij8sapIEbLf2g8npOu6XgsQS2w0.jpg")!,
        genresIDs: [0, 1, 2, 3],
        voteAverage: 3.4,
        genres: [.animation, .adventure, .family, .fantasy],
        images: .init(
            logos: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/sst2kO7ySyAm3z5haWXUszOVWi2.png")!
                )
            ],
            posters: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg")!
                )
            ],
            backdrops: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg")!
                )
            ]
        )
    )
}
#endif
