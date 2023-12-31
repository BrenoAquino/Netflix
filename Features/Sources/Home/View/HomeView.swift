//
//  HomeView.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Common
import DesignSystem
import SwiftUI

public struct HomeView: View {

    @ObservedObject private var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(background)
            .task { await viewModel.fetchData() }
    }

    private var background: some View {
        Color.black
            .ignoresSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: View Sate

    private var stateView: some View {
        Group {
            switch viewModel.state {
            case .content:
                content
            case .loading:
                LoadingView()
            case .error:
                Text("Error")
            }
        }
    }

    // MARK: Content

    private var content: some View {
        List {
            highlighters
            carousels
        }
        .listStyle(.plain)
        .listBackgroundColor(Color.clear)
    }

    private var highlighters: some View {
        HighlightersCarouselView(movies: viewModel.highlighters)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.purple)
    }

    private var carousels: some View {
        ForEach(viewModel.carousels, id: \.title) {
            CarouselView(carousel: $0)
                .background(Color.blue)
                .padding(.bottom, SpaceDesignConstant.normal)
        }
        .listRowSeparator(.hidden)
        .listRowInsets(EdgeInsets())
        .listRowBackground(Color.clear)
    }
}

#if DEBUG
import Preview

struct HomeView_Previews: PreviewProvider {

    static var previews: some View {
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear

        return HomeView(
            viewModel: HomeViewModel(
                carouselsService: Preview.CarouselsServicesMock()
            )
        )
    }
}
#endif
