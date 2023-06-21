//
//  File.swift
//  
//
//  Created by Breno Aquino on 20/06/23.
//

#if DEBUG
import Domain
import Foundation

extension Domain.MovieDetail {
    public static var marioBros: MovieDetail { .init(
        id: Int(arc4random() % 10000), // 502356
        title: "Super Mario Bros.: The Film",
        voteAverage: 3.4,
        genres: [.animation, .adventure, .family, .fantasy],
        images: .init(
            logos: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/sst2kO7ySyAm3z5haWXUszOVWi2.png")!,
                    voteAverage: 5
                )
            ],
            posters: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg")!,
                    voteAverage: 5
                )
            ],
            backdrops: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg")!,
                    voteAverage: 5
                )
            ]
        ),
        cleanImages: .init(
            logos: [],
            posters: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg")!,
                    voteAverage: 5
                )
            ],
            backdrops: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg")!,
                    voteAverage: 5
                )
            ]
        )
    ) }

    public static var spiderMan: MovieDetail { .init(
        id: 569094,
        title: "Spider-Man: Across the Spider-Verse",
        voteAverage: 3.4,
        genres: [.animation, .adventure, .family, .fantasy],
        images: .init(
            logos: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/cmE0j3mQQe6xrzLryxGF9rF2KC8.png")!,
                    voteAverage: 5
                )
            ],
            posters: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg")!,
                    voteAverage: 5
                )
            ],
            backdrops: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/nGxUxi3PfXDRm7Vg95VBNgNM8yc.jpg")!,
                    voteAverage: 5
                )
            ]
        ),
        cleanImages: .init(
            logos: [],
            posters: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original//nCYTlpZ1Eme1ryxjytvQqei4801.jpg")!,
                    voteAverage: 5
                )
            ],
            backdrops: [
                .init(
                    aspectRation: 0.66,
                    image: URL(string: "https://image.tmdb.org/t/p/original/2I5eBh98Q4aPq8WdQrHdTC8ARhY.jpg")!,
                    voteAverage: 5
                )
            ]
        )
    ) }
}
#endif
