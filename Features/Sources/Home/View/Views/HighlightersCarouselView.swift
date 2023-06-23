//
//  File.swift
//  
//
//  Created by Breno Aquino on 21/06/23.
//

import DesignSystem
import SwiftUI

struct HighlightersCarouselView: View {

    // MARK: - Variables

    // MARK: Parallax

    private let titleSpeedDivider: CGFloat = 2
    private let finalAngle: Angle = .degrees(45)

    // MARK: Exhibition

    let movies: [MovieDetailUI]

    // MARK: - Views

    var body: some View {
        TabView {
            ForEach(movies) { movie in
                GeometryReader { proxy in
                    let currentX = proxy.frame(in: .global).minX
                    let rotationAngle = -finalAngle * currentX / proxy.size.width
                    let titleOffsetX = currentX / titleSpeedDivider

                    poster(movie, proxy, titleOffsetX)
                        .rotation3DEffect(rotationAngle, axis: (x: 0, y: 1, z: 0))
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
    }

    @ViewBuilder private func poster(
        _ movie: MovieDetailUI,
        _ proxy: GeometryProxy,
        _ titleOffsetX: CGFloat = .zero
    ) -> some View {
        CachedAsyncImage(url: movie.cleanPosterURL ?? movie.posterURL) { data in
            data.image
                .resizable()
                .overlay(alignment: .bottom) {
                    titleContainer(movie, proxy, data.uiImage.averageColor, titleOffsetX)
                }
        } placeholder: {
            Text(movie.title)
                .overlay(alignment: .bottom) {
                    titleContainer(movie, proxy, nil, titleOffsetX)
                }
        }
        .aspectRatio(AspectDesignConstant.portrait, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: RadiusDesignConstant.hard))
        .padding(.horizontal, SpaceDesignConstant.normal)
        .frame(width: proxy.size.width)
    }

    @ViewBuilder private func titleContainer(
        _ movie: MovieDetailUI,
        _ proxy: GeometryProxy,
        _ averageColor: Color? = nil,
        _ titleOffsetX: CGFloat = .zero
    ) -> some View {
        let averageColor = averageColor ?? Color.black
        ZStack {
            VStack {
                Spacer().frame(height: SpaceDesignConstant.bigL)
                title(movie, proxy, titleOffsetX)
                Spacer().frame(height: SpaceDesignConstant.bigL)
            }
        }
        .background(
            averageColor
                .blur(radius: RadiusDesignConstant.blurHard)
        )
    }

    @ViewBuilder private func title(
        _ movie: MovieDetailUI,
        _ proxy: GeometryProxy,
        _ titleOffsetX: CGFloat = .zero
    ) -> some View {
        CachedAsyncImage(url: movie.logoURL) { data in
            data.image.resizable()
        } placeholder: {
            Text(movie.title)
        }
        .aspectRatio(contentMode: .fit)
        .padding(.horizontal, SpaceDesignConstant.normal)
        .padding(.horizontal, SpaceDesignConstant.normal)
        .offset(x: titleOffsetX)
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
