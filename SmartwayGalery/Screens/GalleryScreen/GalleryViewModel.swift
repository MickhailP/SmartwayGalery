//
//  GalleryViewModel.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import Foundation
import Combine

final class GalleryViewModel: ObservableObject {

	private let networkingService: NetworkingProtocol

	@Published private(set) var photos: [Photo] = []

	// MARK: Alert tracker
	@Published var showErrorMessage: Bool = false
	@Published private(set) var errorMessage: String = ""

	var page = 0

	private(set) var cancellables = Set<AnyCancellable>()


	init(networkingService: NetworkingProtocol) {
		self.networkingService = networkingService

	}


	func fetchImages() {
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
					case .failure(let error):
						print(error)
						self.showErrorMessage = true
						self.errorMessage = ErrorMessage.fetchingError.localised
				}
			} receiveValue: { [weak self] receivedPhotos in
				self?.photos.append(contentsOf: receivedPhotos)
				print("fetched")
			}
			.store(in: &cancellables)
	}
}
