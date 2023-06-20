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
            .background(Color.purple)
            .task {
                await viewModel.fetchData()
            }
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
            contentHeader
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.clear)
                .padding(.bottom, SpaceDesignConstant.normal)

            ForEach(viewModel.carousels, id: \.title) {
                CarouselView(carousel: $0)
                    .padding(.bottom, SpaceDesignConstant.normal)
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .ignoresSafeArea(.all)
        .listRowInsets(EdgeInsets())
        .listBackgroundColor(Color.clear)
    }

    @ViewBuilder private var contentHeader: some View {
        if let mainContent = viewModel.mainContent {
            PosterView(content: mainContent)
                .shadow(radius: RadiusDesignConstant.hard)
        }
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
