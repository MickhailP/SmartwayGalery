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


	@Published var imageUrl: String?
	@Published private(set) var image: UIImage?


	// MARK: Init
	init(imageUrl: String, networking: NetworkingProtocol) {
		self.networking = networking
		self.imageUrl = imageUrl
		self.cache = ImageCacheService.shared
		getImage()
	}


	private func getImage() {
		guard let imageUrl else { return }
		
		if let image = cache.get(key: imageUrl) {
			self.image = image
		} else {
			downloadImage()
		}
	}


	/// Download an image by it's URL from the internet
	private func downloadImage() {
		Task {
			guard let imageUrl else { return }

			if let image = await networking?.fetchImage(from: imageUrl) {
				cache.add(key: imageUrl, value: image)

				DispatchQueue.main.async {
					self.image = image
				}
			}
		}
	}
}
