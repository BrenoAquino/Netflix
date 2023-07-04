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
    @Published var highlighters: [MovieDetailUI] = []
    @Published var carousels: [CarouselUI] = []

    // MARK: External Actions

    public var didSelectMovie: ((_ movieID: Int) -> Void)? = nil

    // MARK: Inits

    public init(carouselsService: Domain.CarouselsService) {
        self.carouselsService = carouselsService
    }
}

// MARK: - Public Methods

extension HomeViewModel {

    func fetchData() async {
        do {
            let carouselHighlighters = try await carouselsService.highlighted().compactMap { MovieDetailUI(movie: $0) }
            async let carouselTopRated = try carouselsService.topRated().compactMap { MovieUI(movie: $0) }
            async let carouselUpcoming = try carouselsService.upcoming().compactMap { MovieUI(movie: $0) }
            async let carouselPopular = try carouselsService.popular().compactMap { MovieUI(movie: $0) }

            let homeCarousels = try await [
                ("Top Rated", carouselTopRated),
                ("Upcoming", carouselUpcoming),
                ("Popular", carouselPopular),
            ].compactMap { CarouselUI(title: $0.0, movies: $0.1) }

            await MainActor.run { [self] in
                highlighters = carouselHighlighters
                carousels = homeCarousels
                state = .content
            }
        } catch {
            Logger.log(level: .error, "\(String(describing: error)) | \(error.localizedDescription)")
            await MainActor.run { [self] in
                state = .error
            }
        }
    }
}

// MARK: - Utils Extensions

private extension CarouselUI {
    convenience init?(title: String, movies: [MovieUI]?) {
        guard let movies else { return nil }
        self.init(title: title, movies: movies)
    }
}
