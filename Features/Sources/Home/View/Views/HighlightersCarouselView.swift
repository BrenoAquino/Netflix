//
//  File.swift
//  
//
//  Created by Breno Aquino on 21/06/23.
//

import Common
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
                    let currentX = proxy.frame(in: .global).minX - SpaceDesignConstant.normal
                    let rotationAngle = -finalAngle * currentX / proxy.size.width
                    let titleOffsetX = currentX / titleSpeedDivider

                    poster(movie, titleOffsetX)
                        .rotation3DEffect(rotationAngle, axis: (x: 0, y: 1, z: 0))
                        .position(proxy.frame(in: .local).center)
                }
                .aspectRatio(.portrait, contentMode: .fit)
                .padding(space: .normal)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .aspectRatio(.portrait, contentMode: .fit)
    }

    private func poster(
        _ movie: MovieDetailUI,
        _ titleOffsetX: CGFloat = .zero
    ) -> some View {
        CachedAsyncImage(url: movie.cleanPosterURL ?? movie.posterURL) { data in
            data.image
                .resizable()
                .overlay(alignment: .bottom) {
                    titleContainer(movie, titleOffsetX, data.uiImage.averageColor)
                }
        } placeholder: {
            Text(movie.title)
                .overlay(alignment: .bottom) {
                    titleContainer(movie, titleOffsetX)
                }
        }
        .clipShape(RoundedRectangle(cornerRadius: RadiusDesignConstant.hard))
        .frame(maxWidth: .infinity)
    }

    private func titleContainer(
        _ movie: MovieDetailUI,
        _ titleOffsetX: CGFloat = .zero,
        _ averageColor: Color? = nil
    ) -> some View {
        let averageColor = averageColor ?? Color.black

        return title(movie, titleOffsetX)
            .padding(.vertical, space: .bigL)
            .background(
                averageColor
                    .blur(radius: .hard)
            )
            .frame(maxHeight: 300)
            .fixedSize(horizontal: false, vertical: true)
    }

    private func title(
        _ movie: MovieDetailUI,
        _ titleOffsetX: CGFloat = .zero
    ) -> some View {
        CachedAsyncImage(url: movie.logoURL) { data in
            data.image.resizable()
        } placeholder: {
            Text(movie.title)
        }
        .aspectRatio(contentMode: .fit)
        .padding(.horizontal, space: .normal)
        .padding(.horizontal, space: .normal)
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
        .preferredColorScheme(.dark)

        HomeView(
            viewModel: HomeViewModel(
                carouselsService: Preview.CarouselsServicesMock()
            )
        )
    }
}
#endif
