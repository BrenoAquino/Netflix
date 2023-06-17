//
//  HomeCoordinator.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import SwiftUI
import Home

struct HomeCoordinator: View {

    // MARK: Coordinator
    @ObservedObject var viewModel: HomeCoordinatorViewModel

    init(viewModel: HomeCoordinatorViewModel) {
        self.viewModel = viewModel
    }

    // MARK: Self View
    var body: some View {
        Home.HomeView(viewModel: viewModel.homeViewModel)
    }
}
