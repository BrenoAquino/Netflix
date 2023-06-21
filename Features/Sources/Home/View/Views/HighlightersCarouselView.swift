//
//  File.swift
//  
//
//  Created by Breno Aquino on 21/06/23.
//

import DesignSystem
import SwiftUI

struct HighlightersCarouselView: View {

    let movies: [MovieDetailUI]

    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(movies) { movie in
                        poster(movie, proxy)
                    }
                }
            }
        }
    }

    @ViewBuilder private func poster(_ movie: MovieDetailUI, _ proxy: GeometryProxy) -> some View {
        CachedAsyncImage(url: movie.posterURL) { image in
            image.resizable()
        } placeholder: {
            Text(movie.title)
        }
        .aspectRatio(AspectDesignConstant.portrait, contentMode: .fit)
        .frame(width: proxy.size.width)
    }
}

#if DEBUG
import Preview
import Domain

struct HighlightersCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightersCarouselView(movies: [
            .init(movie: Domain.MovieDetail.marioBros),
            .init(movie: Domain.MovieDetail.spiderMan)
        ])
    }
}
#endif