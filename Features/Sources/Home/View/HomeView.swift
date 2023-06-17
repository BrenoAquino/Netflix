//
//  HomeView.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import DesignSystem
import SwiftUI

public struct HomeView: View {

    @ObservedObject private var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        stateView
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(background)
            .onAppear(perform: viewModel.fetchData)
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
        ScrollView(.vertical, showsIndicators: false) {
            contentHeader
            carouselsList
        }
    }

    @ViewBuilder private var contentHeader: some View {
        if let mainContent = viewModel.mainContent {
            PosterView(content: mainContent)
                .shadow(radius: RadiusDesignConstant.hard)
        }
    }

    private var carouselsList: some View {
        VStack(alignment: .leading, spacing: VDesignConstant.normal) {
            ForEach(viewModel.carousels, id: \.title) { carousel in
                CarouselView(carousel: carousel)
            }
        }
        .padding(.top, VDesignConstant.normal)
    }
}

#if DEBUG
import Preview

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            viewModel: HomeViewModel(
                carouselsService: Preview.CarouselsServicesMock()
            )
        )
    }
}
#endif