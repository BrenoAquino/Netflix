//
//  PosterView.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import DesignSystem
import SwiftUI

struct PosterView: View {

    private let content: ContentUI

    init(content: ContentUI) {
        self.content = content
    }

    var body: some View {
        AsyncImage(
            url: content.portraitPosterURL,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
            },
            placeholder: {
                Text("Loading")
            })
        .overlay { infoContainer }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding(.horizontal, 32)
    }

    private var infoContainer: some View {
        VStack {
            Spacer()
            VStack(spacing: 8) {
                title
                categories
                buttons
            }
            .padding(.bottom, 16)
            .frame(maxWidth: .infinity)
            .background(
                Color.black
                    .opacity(0.4)
                    .background(.ultraThinMaterial)
                    .blur(radius: 8)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, -16)
                    .padding(.horizontal, -16)
            )
        }
    }

    private var title: some View {
        Text(content.title.uppercased())
            .font(.title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
    }

    private var categories: some View {
        Text(content.genresJoined)
            .font(.subheadline)
            .fontWeight(.regular)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
    }

    private var buttons: some View {
        HStack(spacing: 16) {
            Button(action: {}) {
                HStack(spacing: 8) {
                    Image(systemName: "play.fill")
                        .foregroundColor(.black)

                    Text("Assistir")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(NFButtonStyle(backgroundColor: .white))

            Button(action: {}) {
                HStack(spacing: 8) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)

                    Text("Minha lista")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(NFButtonStyle(backgroundColor: .black))
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
    }
}

#if DEBUG
struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(content: .init(
            title: "Super Mario Bros.: O Filme",
            genres: [
                .init(name: "Animação"),
                .init(name: "Aventura"),
                .init(name: "Família"),
                .init(name: "Fantasia")
            ],
            portraitPosterURL: URL(
                string: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/ij8sapIEbLf2g8npOu6XgsQS2w0.jpg"
            )!
        ))
    }
}
#endif
