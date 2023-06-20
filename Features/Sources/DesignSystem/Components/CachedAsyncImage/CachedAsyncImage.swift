//
//  CachedAsyncImage.swift
//  
//
//  Created by Breno Aquino on 16/06/23.
//

import Foundation
import SwiftUI

// https://github.dev/lorenzofiamingo/swiftui-cached-async-image/blob/main/Sources/CachedAsyncImage/CachedAsyncImage.swift

public enum CachedAsyncImageError: Error {
    case missingURL
    case invalidData
}

public struct CachedAsyncImage<Content: View, Placeholder: View>: View {

    private let url: URL?
    private let urlSession: URLSession

    @State private var phase: AsyncImagePhase = .empty

    @ViewBuilder private let content: (Image) -> Content
    @ViewBuilder private let placeholder: () -> Placeholder

    public init(
        url: URL?,
        urlSession: URLSession = .shared,
        content: @escaping (Image) -> Content,
        placeholder: @escaping () -> Placeholder
    ) {
        self.url = url
        self.urlSession = urlSession
        self.content = content
        self.placeholder = placeholder
    }

    public var body: some View {
        contentView.task { await retrieveImage() }
    }

    private var contentView: some View {
        Group {
            switch phase {
            case .success(let image):
                content(image)
            case .empty, .failure:
                placeholder()
            @unknown default:
                fatalError()
            }
        }
    }
}

// MARK: Retrieve Image

extension CachedAsyncImage {

    @Sendable private func retrieveImage() async {
        guard let url else {
            phase = .failure(CachedAsyncImageError.missingURL)
            return
        }

        let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
        if let image = cachedImage(request: request) {
            phase = .success(image)
            return
        }

        do {
            let image = try await sourceImage(request: request)
            phase = .success(image)
        } catch {
            phase = .failure(error)
        }
    }

    private func sourceImage(request: URLRequest) async throws  -> Image {
        let (data, response) = try await urlSession.data(for: request)
        let cachedURLResponse = CachedURLResponse(response: response, data: data, storagePolicy: .allowed)
        urlSession.configuration.urlCache?.storeCachedResponse(cachedURLResponse, for: request)

        guard let image = Image(data: data) else {
            throw CachedAsyncImageError.invalidData
        }

        return image
    }

    private func cachedImage(request: URLRequest) -> Image? {
        guard
            let cachedURLResponse = urlSession.configuration.urlCache?.cachedResponse(for: request),
            let image = Image(data: cachedURLResponse.data)
        else {
            return nil
        }
        return image
    }
}

// MARK: Utils

private extension Image {
    init?(data: Data) {
        guard let image = UIImage(data: data) else { return nil }
        self.init(uiImage: image)
    }
}
