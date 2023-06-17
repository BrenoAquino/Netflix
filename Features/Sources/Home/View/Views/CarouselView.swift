//
//  CarouselView.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import SwiftUI

struct CarouselView: View {

    private let carousel: CarouselUI

    init(carousel: CarouselUI) {
        self.carousel = carousel
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(carousel.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.horizontal, 24)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(carousel.contents, id: \.title) { content in
                        AsyncImage(
                            url: content.portraitPosterURL,
                            content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
                                    .frame(height: 240)
                            },
                            placeholder: {
                                Text("Loading")
                            })
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

#if DEBUG
import Domain
import Preview

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(carousel: .init(
            title: "Series Aclamadas",
            contents: [
                .init(movie: Domain.Movie.marioBros),
                .init(movie: Domain.Movie.marioBros),
                .init(movie: Domain.Movie.marioBros),
                .init(movie: Domain.Movie.marioBros),
                .init(movie: Domain.Movie.marioBros),
                .init(movie: Domain.Movie.marioBros)
            ]
        ))
    }
}
#endif
