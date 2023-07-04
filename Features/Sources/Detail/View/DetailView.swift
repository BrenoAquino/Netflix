//
//  DetailView.swift
//  
//
//  Created by Breno Aquino on 04/07/23.
//

import DesignSystem
import SwiftUI

public struct DetailView: View {

    @ObservedObject private var viewModel: DetailViewModel

    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        stateView
            .task(viewModel.fetchMovie)
    }

    // MARK: State View

    private var stateView: some View {
        switch viewModel.state {
        case .content:
            if let movie = viewModel.movie {
                return AnyView(content(movie))
            } else {
                return AnyView(error)
            }
        case .loading:
            return AnyView(LoadingView())
        case .error:
            return AnyView(error)
        }
    }

    // MARK: Each State

    private func content(_ movie: MovieDetailUI) -> some View {
        ScrollView {
            PosterView(movie: movie)
        }
    }

    private var error: some View {
        Text("error")
    }
}

#if DEBUG
import Preview

struct DetailView_Preview: PreviewProvider {

    static var previews: some View {
        DetailView(viewModel: .init(
            movieService: Preview.MovieServicesMock(),
            movieID: 123
        ))
        .preferredColorScheme(.dark)
    }
}
#endif
