//
//  DetailImageScreen.swift
//  SmartwayGalery
//
//  Created by Миша Перевозчиков on 10.05.2023.
//

import SwiftUI

struct DetailImageScreen: View {

	let image: UIImage?

    var body: some View {
		ZStack {
			Color.black.opacity(0.8)

			if let image {
				ImageView(image: image)
			} else {
				ProgressView()
					.tint(.white)
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.ignoresSafeArea()
		.overlay(alignment: .topLeading) {
			CrossButtonView()
		}
	}
}

struct DetailImageScreen_Previews: PreviewProvider {
    static var previews: some View {
		DetailImageScreen(image: nil)
    }
}
