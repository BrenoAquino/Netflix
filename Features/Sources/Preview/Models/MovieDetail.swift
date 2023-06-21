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
        voteAverage: Double,
        genres: [Genre],
        images: Images
    ) {
        self.init(
            id: id,
            title: title,
            poster: poster,
            voteAverage: voteAverage,
            genres: genres
        )
        self.images = images
    }
}

extension Domain.MovieDetail {
    public static var marioBros: MovieDetail { .init(
        id: Int(arc4random() % 10000),
        title: "Super Mario Bros.: The Film",
        poster: URL(string: "https://image.tmdb.org/t/p/original/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg")!,
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
    ) }

    public static var spiderMan: MovieDetail { .init(
        id: 569094,
        title: "Spider-Man: Across the Spider-Verse",
        poster: URL(string: "https://image.tmdb.org/t/p/original/xxPXsL8V95dTwL5vHWIIQALkJQS.jpg")!,
        voteAverage: 3.4,
        genres: [.animation, .adventure, .family, .fantasy],
        images: .init(
            logos: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/cmE0j3mQQe6xrzLryxGF9rF2KC8.png")!
                )
            ],
            posters: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg")!
                )
            ],
            backdrops: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/nGxUxi3PfXDRm7Vg95VBNgNM8yc.jpg")!
                )
            ]
        )
    ) }
}
#endif
