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

	// MARK: View initialiser's properties
	let imageURL: String?

	// MARK: Image State
	@Published private(set) var image: UIImage?


	// MARK: Init
	init(imageURL: String, networking: NetworkingProtocol) {
		self.networking = networking
		self.imageURL = imageURL
		downloadImage()
	}

	init(image: UIImage) {
		self.image = image
		self.imageURL = nil
		self.networking = nil
	}

	/// Download an image by it's URL from the internet and handles a Result
	private func downloadImage() {
		Task {
			guard let imageURL else { return }

			let image = await networking?.fetchImage(from: imageURL)

			await MainActor.run {
				self.image = image
			}
		}
	}
}
