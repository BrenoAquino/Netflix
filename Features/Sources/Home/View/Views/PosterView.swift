//
//  PosterView.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import DesignSystem
import SwiftUI

struct PosterView: View {
    
    private let movieDetail: MovieDetailUI
    
    init(movieDetail: MovieDetailUI) {
        self.movieDetail = movieDetail
    }
    
    var body: some View {
        CachedAsyncImage(
            url: movieDetail.posterURL,
            content: { image in
                image
                    .resizable()
                    .aspectRatio(AspectDesignConstant.portrait, contentMode: .fit)
            },
            placeholder: {
                Text("Loading")
                    .background(Color.red)
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
        CachedAsyncImage(
            url: movieDetail.logoURL) { image in
                image.resizable()
            } placeholder: {
                Text(movieDetail.title.uppercased())
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .frame(height: 100)
            .aspectRatio(CGSize(width: 3878, height: 2966), contentMode: .fit)
    }
    
    private var categories: some View {
        Text(movieDetail.genresJoined)
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
        PosterView(movieDetail: .init(
            title: "Super Mario Bros.: The Film",
            genres: [
                .init(name: "adventure"),
                .init(name: "animation")
            ],
            posterURL: URL(string: "https://image.tmdb.org/t/p/original/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg")!,
            backdropURL: URL(string: "https://image.tmdb.org/t/p/original/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg")!,
            logoURL: URL(string: "https://image.tmdb.org/t/p/original/sst2kO7ySyAm3z5haWXUszOVWi2.png")!
        ))
    }
}
#endif
