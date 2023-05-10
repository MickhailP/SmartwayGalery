//
//  GalleryImageRowView.swift
//  SmartwayGalery
//
//  Created by Миша Перевозчиков on 10.05.2023.
//

import SwiftUI

struct GalleryImageRowView: View {

	let imageUrl: String

	var body: some View {
		ImageView(imageURL: imageUrl)
			.clipShape(RoundedRectangle(cornerRadius: 10))
			.frame(maxWidth: .infinity)
			.shadow(radius: 5)
	}
}

struct GalleryImageRowView_Previews: PreviewProvider {
    static var previews: some View {
		GalleryImageRowView(imageUrl: Photo.example.urls.regular)
    }
}
