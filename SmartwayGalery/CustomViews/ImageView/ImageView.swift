//
//  ImageView.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 10.05.2023.
//

import SwiftUI

struct ImageView: View {
	
	@StateObject private var viewModel: ImageViewModel
	
//MARK: Init
	init(imageUrl: String) {
		_viewModel = StateObject(wrappedValue: ImageViewModel(imageUrl: imageUrl, networking: NetworkingService()))
	}


// MARK: View
	@ViewBuilder var body: some View {
		if let image = viewModel.image {
			Image(uiImage: image)
				.resizable()
				.scaledToFit()
		} else {
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.fill(Color.gray.opacity(0.3))
				ProgressView()
			}
		}
	}
}


// MARK: Preview
struct ImageView_Previews: PreviewProvider {
	static var previews: some View {
		ImageView(imageUrl: Photo.example.urls.regular)
	}
}
