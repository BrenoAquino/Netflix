//
//  CarouselView.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import DesignSystem
import SwiftUI

struct CarouselView: View {

    private let carousel: CarouselUI

    init(carousel: CarouselUI) {
        self.carousel = carousel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: SpaceDesignConstant.smallM) {
            Text(carousel.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.horizontal, SpaceDesignConstant.normal)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: SpaceDesignConstant.smallM) {
                    ForEach(carousel.movies) { movie in
                        poster(movie)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding(.horizontal, SpaceDesignConstant.normal)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
    }

    private func poster(_ content: MovieUI) -> some View {
        GeometryReader { proxy in
            CachedAsyncImage(
                url: content.posterURL,
                content: { data in
                    data.image
                        .resizable()
                },
                placeholder: {
                    placeholder(content.title)
                }
            )
        }
        .aspectRatio(AspectDesignConstant.portrait, contentMode: .fit)
        .frame(width: DesignConstants.Carousel.posterWidth)
        .clipShape(RoundedRectangle(cornerRadius: RadiusDesignConstant.normal))
    }

    private func placeholder(_ title: String) -> some View {
        VStack(spacing: SpaceDesignConstant.smallL) {
            ProgressView()
            Text(title)
                .multilineTextAlignment(.center)
                .padding(.horizontal, SpaceDesignConstant.smallM)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
    }
}

#if DEBUG
import Domain
import Preview

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(carousel: .init(
            title: "Series Aclamadas",
            movies: [
                .init(movie: Domain.Movie.marioBros),
                .init(movie: Domain.Movie.marioBros),
                .init(movie: Domain.Movie.marioBros),
                .init(movie: Domain.Movie.marioBros),
                .init(movie: Domain.Movie.marioBros),
                .init(movie: Domain.Movie.marioBros)
            ]
        ))
        .preferredColorScheme(.dark)

        HomeView(
            viewModel: HomeViewModel(
                carouselsService: Preview.CarouselsServicesMock()
            )
        )
    }
}
#endif
