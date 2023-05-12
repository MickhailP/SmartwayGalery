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
				.listRowSeparator(.hidden)
			}
			.listStyle(.plain)
		}
		.overlay(alignment: .center) {
			if viewModel.isLoading {
				LoadingView()
			}
		}
		.fullScreenCover(item: $viewModel.selectedPhoto, content: { photo in
			DetailImageScreen(imageURL: photo.urls.small)
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
