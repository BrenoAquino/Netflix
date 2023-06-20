//
//  HomeViewModel.swift
//  
//
//  Created by Breno Aquino on 22/03/23.
//

import Common
import Domain
import Foundation

enum HomeState {
    case loading
    case content
    case error
}

public class HomeViewModel: ObservableObject {

    // MARK: Variables

    private let carouselsService: Domain.CarouselsService

    // MARK: Publishers

    @Published var state: HomeState = .loading
    @Published var mainContent: ContentUI? = nil
    @Published var carousels: [CarouselUI] = []

    // MARK: Inits

    public init(carouselsService: Domain.CarouselsService) {
        self.carouselsService = carouselsService
    }
}

// MARK: - Public Methods

extension HomeViewModel {

    func fetchData() async {
        do {
            let topRatedMovie = ContentUI(movie: try await carouselsService.topRatedMovie())
            async let carouselTopRated = try? carouselsService.topRated().map { ContentUI(movie: $0) }
            async let carouselUpcoming = try? carouselsService.upcoming().map { ContentUI(movie: $0) }
            async let carouselPopular = try? carouselsService.popular().map { ContentUI(movie: $0) }

            let homeCarousels = await [
                ("Top Rated", carouselTopRated),
                ("Upcoming", carouselUpcoming),
                ("Popular", carouselPopular),
            ].compactMap { CarouselUI(title: $0.0, contents: $0.1) }

            await MainActor.run { [self] in
                mainContent = topRatedMovie
                carousels = homeCarousels
                state = .content
            }
        } catch {
            Logger.log(error.localizedDescription)
        }
    }
}

// MARK: - Utils Extensions

private extension CarouselUI {
    convenience init?(title: String, contents: [ContentUI]?) {
        guard let contents else { return nil }
        self.init(title: title, contents: contents)
    }
}
