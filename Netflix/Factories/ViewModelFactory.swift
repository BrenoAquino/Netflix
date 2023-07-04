//
//  ViewModelFactory.swift
//  Netflix
//
//  Created by Breno Aquino on 22/03/23.
//

import Detail
import Foundation
import Home

class ViewModelFactory {
    private init() {}

    private static func home() -> HomeViewModel {
        HomeViewModel(carouselsService: ServiceFactory.carousels())
    }

    static func homeCoordinator() -> HomeCoordinatorViewModel {
        HomeCoordinatorViewModel(viewModel: Self.home())
    }

    private static func detail(movieID: Int) -> DetailViewModel {
        DetailViewModel(movieService: ServiceFactory.movie(), movieID: movieID)
    }

    static func detailCoordinator(movieID: Int) -> DetailCoordinatorViewModel {
        DetailCoordinatorViewModel(viewModel: Self.detail(movieID: movieID))
    }
}
