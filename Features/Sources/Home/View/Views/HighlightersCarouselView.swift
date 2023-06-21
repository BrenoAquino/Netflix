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
                LazyHStack(spacing: .zero) {
                    ForEach(movies) { movie in
                        poster(movie, proxy)
                    }
                }
            }
        }
    }

    @ViewBuilder private func poster(_ movie: MovieDetailUI, _ proxy: GeometryProxy) -> some View {
        CachedAsyncImage(url: movie.cleanPosterURL ?? movie.posterURL) { data in
            data.image.resizable()
                .overlay(alignment: .bottom) {
                    overlay(movie, proxy, data.uiImage.averageColor)
                }
        } placeholder: {
            Text(movie.title)
                .overlay(alignment: .bottom) { overlay(movie, proxy) }
        }
        .aspectRatio(AspectDesignConstant.portrait, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: RadiusDesignConstant.hard))
        .padding(.horizontal, SpaceDesignConstant.normal)
        .frame(width: proxy.size.width)
    }

    @ViewBuilder private func overlay(
        _ movie: MovieDetailUI,
        _ proxy: GeometryProxy,
        _ averageColor: Color? = nil
    ) -> some View {
        let averageColor = averageColor ?? Color.black
        ZStack {
            VStack {
                Spacer().frame(height: SpaceDesignConstant.bigL)
                title(movie, proxy)
                Spacer().frame(height: SpaceDesignConstant.bigL)
            }
        }
        .background(
            averageColor
                .opacity(0.4)
                .background(averageColor)
                .blur(radius: RadiusDesignConstant.blurHard)
//                .padding(.horizontal, -RadiusDesignConstant.normal)
//                .padding(.vertical, -RadiusDesignConstant.normal)
        )
    }

    @ViewBuilder private func title(_ movie: MovieDetailUI, _ proxy: GeometryProxy) -> some View {
        CachedAsyncImage(url: movie.logoURL) { data in
            data.image.resizable()
        } placeholder: {
            Text(movie.title)
        }
        .aspectRatio(contentMode: .fit)
        .padding(.horizontal, SpaceDesignConstant.normal)
        .padding(.horizontal, SpaceDesignConstant.normal)
//        .frame(maxWidth: proxy.size.width, maxHeight: 180)
//        .background(Color.purple)
    }
}

#if DEBUG
import Preview
import Domain

struct HighlightersCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        HighlightersCarouselView(movies: [
            .init(movie: Domain.MovieDetail.marioBros),
            .init(movie: Domain.MovieDetail.spiderMan),
        ])
    }
}
#endif
