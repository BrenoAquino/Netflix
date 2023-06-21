//
//  CachedAsyncImage.swift
//  
//
//  Created by Breno Aquino on 16/06/23.
//

import Foundation
import SwiftUI

public enum CachedAsyncImageError: Error {
    case missingURL
    case invalidData
}

public enum CachedAsyncImagePhase {
    case empty
    case success(ImageData)
    case failure(Error)
}

public struct ImageData {
    public let image: Image
    public let uiImage: UIImage

    init?(data: Data) {
        guard let uiImage = UIImage(data: data) else { return nil }
        self.uiImage = uiImage
        self.image = Image(uiImage: uiImage)
    }
}

public struct CachedAsyncImage<Content: View, Placeholder: View>: View {

    private let url: URL?
    private let urlSession: URLSession

    @State private var phase: CachedAsyncImagePhase = .empty

    @ViewBuilder private let content: (ImageData) -> Content
    @ViewBuilder private let placeholder: () -> Placeholder

    public init(
        url: URL?,
        urlSession: URLSession = .shared,
        content: @escaping (ImageData) -> Content,
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

    private func sourceImage(request: URLRequest) async throws  -> ImageData {
        let (data, response) = try await urlSession.data(for: request)
        let cachedURLResponse = CachedURLResponse(response: response, data: data, storagePolicy: .allowed)
        urlSession.configuration.urlCache?.storeCachedResponse(cachedURLResponse, for: request)

        guard let image = ImageData(data: data) else {
            throw CachedAsyncImageError.invalidData
        }
        return image
    }

    private func cachedImage(request: URLRequest) -> ImageData? {
        guard let cachedURLResponse = urlSession.configuration.urlCache?.cachedResponse(for: request) else {
            return nil
        }
        return ImageData(data: cachedURLResponse.data)
    }
}
