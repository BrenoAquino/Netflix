//
//  HomeCoordinatorViewModel.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Foundation
import Home

class HomeCoordinatorViewModel: ObservableObject {
    let homeViewModel: Home.HomeViewModel

    init(viewModel: Home.HomeViewModel) {
        self.homeViewModel = viewModel
    }
}
