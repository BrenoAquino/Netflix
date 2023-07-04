//
//  HomeCoordinatorViewModel.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Detail
import Foundation
import Home

class HomeCoordinatorViewModel: ObservableObject {

    // MARK: Variables

    let homeViewModel: Home.HomeViewModel

    // MARK: Destinations ViewModel
    
    @Published private(set) var destinationDetailViewModel: DetailCoordinatorViewModel?

    // MARK: Inits

    init(viewModel: Home.HomeViewModel) {
        self.homeViewModel = viewModel
        self.homeViewModel.didSelectMovie = { [weak self] movieID in
            self?.destinationDetailViewModel = ViewModelFactory.detailCoordinator(movieID: movieID)
        }
    }
}
