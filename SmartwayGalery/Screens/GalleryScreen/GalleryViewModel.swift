//
//  GalleryViewModel.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import Foundation
import UIKit
import Combine

final class GalleryViewModel: ObservableObject {

	private let networkingService: NetworkingProtocol

	@Published private(set) var photos: [Photo] = []
	@Published var selectedPhoto: Photo?

	// MARK: Alert tracker
	@Published var showErrorMessage: Bool = false
	@Published private(set) var errorMessage: String = ""
	@Published var isLoading = false

	var page = 0

	private(set) var cancellables = Set<AnyCancellable>()


	init(networkingService: NetworkingProtocol) {
		self.networkingService = networkingService
		fetchImages()
	}

	func loadMoreContentIfNeeded(currentPhoto photo: Photo) {
		if photos.last?.id == photo.id {
			fetchImages()
		}
	}


	private func fetchImages() {

		isLoading = true

		page += 1

		let url = Endpoint.photoList(page: page).url

		guard let url else {
			showErrorMessage = true
			errorMessage = ErrorMessage.badURL.localised
			return
		}

		networkingService.downloadData(from: url)
			.sink { completion in
				switch completion{
					case .finished:
						print("Finished")
						self.isLoading = false
					case .failure(let error):
						print(error)
						self.showErrorMessage = true
						self.errorMessage = ErrorMessage.fetchingError.localised
						self.isLoading = false
				}
			} receiveValue: { [weak self] receivedPhotos in
				self?.photos += receivedPhotos
				
				print("fetched")
			}
			.store(in: &cancellables)
	}
}
