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
        TabView {
            ForEach(movies) { movie in
                GeometryReader { proxy in
                    let minX = proxy.frame(in: .global).minX
                    poster(movie, proxy, minX / 2)
                        .rotation3DEffect(
                            .degrees(-minX / 10),
                            axis: (x: 0, y: 1, z: 0)
                        )
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }

    @ViewBuilder private func poster(
        _ movie: MovieDetailUI,
        _ proxy: GeometryProxy,
        _ offsetX: CGFloat = .zero
    ) -> some View {
        CachedAsyncImage(url: movie.cleanPosterURL ?? movie.posterURL) { data in
            data.image.resizable()
                .overlay(alignment: .bottom) {
                    overlay(movie, proxy, data.uiImage.averageColor, offsetX)
                }
        } placeholder: {
            Text(movie.title)
                .overlay(alignment: .bottom) { overlay(movie, proxy, nil, offsetX) }
        }
        .aspectRatio(AspectDesignConstant.portrait, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: RadiusDesignConstant.hard))
        .padding(.horizontal, SpaceDesignConstant.normal)
        .frame(width: proxy.size.width)
    }

    @ViewBuilder private func overlay(
        _ movie: MovieDetailUI,
        _ proxy: GeometryProxy,
        _ averageColor: Color? = nil,
        _ offsetX: CGFloat = .zero
    ) -> some View {
        let averageColor = averageColor ?? Color.black
        ZStack {
            VStack {
                Spacer().frame(height: SpaceDesignConstant.bigL)
                title(movie, proxy, offsetX)
                Spacer().frame(height: SpaceDesignConstant.bigL)
            }
        }
        .background(
            averageColor
                .opacity(0.4)
                .background(averageColor)
                .blur(radius: RadiusDesignConstant.blurHard)
        )
    }

    @ViewBuilder private func title(
        _ movie: MovieDetailUI,
        _ proxy: GeometryProxy,
        _ offsetX: CGFloat = .zero
    ) -> some View {
        CachedAsyncImage(url: movie.logoURL) { data in
            data.image.resizable()
        } placeholder: {
            Text(movie.title)
        }
        .aspectRatio(contentMode: .fit)
        .padding(.horizontal, SpaceDesignConstant.normal)
        .padding(.horizontal, SpaceDesignConstant.normal)
        .offset(x: offsetX)
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
