//
//  ImageView.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 10.05.2023.
//

import SwiftUI

struct ImageView: View {
	
	@StateObject private var viewModel: ImageViewModel
	
	
	// MARK: Inits
	init(imageURL: String) {
		_viewModel = StateObject(wrappedValue: ImageViewModel(imageURL: imageURL, networking: NetworkingService()))
	}
	
	
	init(image: UIImage) {
		_viewModel = StateObject(wrappedValue: ImageViewModel(image: image))
	}
	
	
	// MARK: View
	var body: some View {
		if let image = viewModel.image {
			Image(uiImage: image)
				.resizable()
				.scaledToFit()
		} else {
			ZStack {
				RoundedRectangle(cornerRadius: 10)
					.fill(.ultraThickMaterial)
					.frame(height: 100)
				ProgressView()
			}
		}
	}
}

// MARK: Preview
struct ImageView_Previews: PreviewProvider {
	static var previews: some View {
		ImageView(imageURL: Photo.example.urls.regular)
	}
}
