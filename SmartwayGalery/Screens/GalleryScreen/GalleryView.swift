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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
				.onAppear() {
					viewModel.fetchImages()
				}
        }
        .padding()

    }
}


struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
