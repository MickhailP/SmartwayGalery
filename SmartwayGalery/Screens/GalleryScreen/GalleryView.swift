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
					GalleryImageRowView(imageUrl: photo.urls.regular)
						.onAppear {
							viewModel.loadMoreContentIfNeeded(currentPhoto: photo)
						}
				}
				.listRowSeparator(.hidden)
			}
			.frame(maxWidth: .infinity)
			.listStyle(.plain)
		}
		.overlay(alignment: .center) {
			if viewModel.isLoading {
				ZStack{
					Color.gray.opacity(0.6)
					ProgressView()
				}
				.ignoresSafeArea()
			}
		}
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
