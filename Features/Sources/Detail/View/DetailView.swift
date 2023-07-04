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

    private var stateView: some View {
        guard let movie = viewModel.movie else {
            return AnyView(Text("Error"))
        }
        switch viewModel.state {
        case .content:
            return AnyView(content(movie))
        case .loading:
            return AnyView(LoadingView())
        case .error:
            return AnyView(Text("Error"))
        }
    }

    private func content(_ movie: MovieDetailUI) -> some View {
        Text(movie.title)
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
    }
}
#endif
