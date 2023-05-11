//
//  ImageViewModel.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 10.05.2023.
//

import Foundation
import UIKit

final class ImageViewModel: ObservableObject {

	private let networking: NetworkingProtocol?
	private let cache: ImageCacheService

	// MARK: View initialiser's properties
	let imageURL: String?

	// MARK: Image State
	@Published private(set) var image: UIImage?


	// MARK: Init
	init(imageURL: String, networking: NetworkingProtocol, cache: ImageCacheService = ImageCacheService.shared) {
		self.networking = networking
		self.imageURL = imageURL
		self.cache = cache
		downloadImage()
	}


	init(image: UIImage, cache: ImageCacheService = ImageCacheService.shared) {
		self.image = image
		self.imageURL = nil
		self.networking = nil
		self.cache = cache
	}

	/// Download an image by it's URL from the internet and handles a Result
	private func downloadImage() {
		Task {
			guard let imageURL else { return }

			if let image = await networking?.fetchImage(from: imageURL) {
				cache.add(key: imageURL, value: image)

				await MainActor.run {
					self.image = image
				}
			}
		}
	}
}
