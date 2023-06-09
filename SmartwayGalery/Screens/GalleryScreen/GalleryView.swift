//
//  GalleryView.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import SwiftUI

struct GalleryView: View {

	@EnvironmentObject var networkMonitor: NetworkMonitor

	@StateObject var viewModel = GalleryViewModel(networkingService: NetworkingService())


	var body: some View {
		ZStack {
			VStack {
				List {
					ForEach(viewModel.photos) { photo in
						HStack {
							Button {
								viewModel.selectedPhoto = photo
							} label: {
								GalleryImageRowView(imageUrl: photo.urls.small)
									.opacity(viewModel.isLoading ? 0.4 : 1)
							}
						}
						.buttonStyle(.plain)
						.onAppear {
							viewModel.loadMoreContentIfNeeded(currentPhoto: photo)
						}
					}
				}
				.listStyle(.plain)
			}

			LoadingView().opacity(viewModel.isLoading ? 1 : 0)
		}
		.fullScreenCover(item: $viewModel.selectedPhoto, content: { photo in
			DetailImageScreen(imageURL: photo.urls.small)
		})
		.alert(isPresented: $viewModel.showErrorMessage) {
			Alert(title: Text("Error!"), message: Text(viewModel.errorMessage))
		}
		.onChange(of: networkMonitor.isConnected) { status in
			if status == false {
				viewModel.showErrorMessage = true
				viewModel.errorMessage = ErrorMessage.connectionLost.localised
			}
		}

	}
}


struct GalleryView_Previews: PreviewProvider {
	static var previews: some View {
		GalleryView()
	}
}
