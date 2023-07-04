//
//  HomeCoordinator.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import SwiftUI
import Home

struct HomeCoordinator: View {

    // MARK: Variables

    @ObservedObject var viewModel: HomeCoordinatorViewModel

    // MARK: Inits

    init(viewModel: HomeCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Self View

    var body: some View {
        Home.HomeView(viewModel: viewModel.homeViewModel)
    }
}

// MARK: Destinations

extension HomeCoordinator {

}
