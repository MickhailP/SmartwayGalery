//
//  GalleryView.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import SwiftUI

struct GalleryView: View {

	@StateObject var viewModel = GalleryViewModel(networkingService: NetworkingService())

	var body: some View {
		ZStack {
			List {
				ForEach(viewModel.photos) { photo in
					Button {
						viewModel.selectedPhoto = photo
					} label: {
						GalleryImageRowView(imageUrl: photo.urls.regular)
					}

					.onAppear {
						viewModel.loadMoreContentIfNeeded(currentPhoto: photo)
					}
					.opacity(viewModel.isLoading ? 0.4 : 1)
				}
				.listRowSeparator(.hidden)
			}
			.frame(maxWidth: .infinity)
			.listStyle(.plain)
		}
		.overlay(alignment: .center) {
			if viewModel.isLoading {
				LoadingView()
			}
		}
		.fullScreenCover(item: $viewModel.selectedPhoto, content: { photo in

			DetailImageScreen(image: viewModel.getImageFromCache(by: photo.urls.regular))
		})
		.alert(isPresented: $viewModel.showErrorMessage) {
			Alert(title: Text("Error!"), message: Text(viewModel.errorMessage))
		}
	}
}


struct GalleryView_Previews: PreviewProvider {
	static var previews: some View {
		GalleryView()
	}
}
