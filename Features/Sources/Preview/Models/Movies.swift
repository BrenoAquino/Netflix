//
//  File.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

#if DEBUG
import Domain
import Foundation

private extension Domain.Movie {
    init(id: Int, title: String, poster: URL, genres: [Genre], voteAverage: Double) {
        self.init(id: id, title: title, poster: poster, genresIDs: genres.map { $0.id }, voteAverage: voteAverage)
        self.genres = genres
    }
}

extension Domain.Movie {
    public static var marioBros: Movie {
        .init(
            id: Int(arc4random() % 100),
            title: "Super Mario Bros.: The Film",
            poster: URL(string: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/ij8sapIEbLf2g8npOu6XgsQS2w0.jpg")!,
            genres: [.animation, .adventure, .family, .fantasy],
            voteAverage: 3.4
        )
    }
}

#endif
