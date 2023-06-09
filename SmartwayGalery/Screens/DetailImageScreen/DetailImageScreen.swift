//
//  DetailImageScreen.swift
//  SmartwayGalery
//
//  Created by Миша Перевозчиков on 10.05.2023.
//

import SwiftUI

struct DetailImageScreen: View {

	@EnvironmentObject var networkMonitor: NetworkMonitor

	let imageURL: String

	@State private var currentZoomValue: CGFloat = 0
	@State private var lastZoomValue: CGFloat = 0

	@State private var showErrorMessage: Bool = false
	@State private var errorMessage: String = ""


    var body: some View {
		ZStack {
			Group {
				Color.black.opacity(0.8)

				ImageView(imageUrl: imageURL)
					.scaleEffect(1 + currentZoomValue)
					.gesture(zoomGesture)
			}
				.ignoresSafeArea()

			VStack {
				HStack {
					CrossButtonView()
						.frame(width: 30, height: 30)
					Spacer()
				}
				Spacer()
			}
			.padding(15)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.alert(isPresented: $showErrorMessage) {
			Alert(title: Text("Error!"), message: Text(errorMessage))
		}
		.onChange(of: networkMonitor.isConnected) { status in
			if status == false {
				showErrorMessage = true
				errorMessage = ErrorMessage.connectionLost.localised
			}
		}
	}
}



//MARK: - Zoom Gesture
extension DetailImageScreen {

	private var zoomGesture: some Gesture {
		MagnificationGesture()
			.onChanged{ value in
				currentZoomValue = value - 1
			}
			.onEnded{ value in
				withAnimation {
					currentZoomValue = 0
				}
			}
	}
}


struct DetailImageScreen_Previews: PreviewProvider {

    static var previews: some View {
		DetailImageScreen(imageURL: Photo.example.urls.regular)
			.environmentObject(NetworkMonitor())
    }
}
