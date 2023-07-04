//
//  PosterView.swift
//  
//
//  Created by Breno Aquino on 04/07/23.
//

import DesignSystem
import SwiftUI

struct PosterView: View {

    private let movie: MovieDetailUI

    init(movie: MovieDetailUI) {
        self.movie = movie
    }

    var body: some View {
        CachedAsyncImage(
            url: movie.posterURL,
            content: { data in
                data.image.resizable()
            },
            placeholder: {
                Text(movie.title)
            }
        )
        .aspectRatio(.portrait, contentMode: .fit)
    }
}

#if DEBUG
import Preview
import Domain

struct PosterView_Preview: PreviewProvider {

    static var previews: some View {
        PosterView(movie: .init(
            movie: Domain.MovieDetail.spiderMan
        ))
        .preferredColorScheme(.dark)
    }
}
#endif
