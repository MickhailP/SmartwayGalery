//
//  CrossButtonView.swift
//  SmartwayGalery
//
//  Created by Миша Перевозчиков on 10.05.2023.
//

import SwiftUI

struct CrossButtonView: View {

	@Environment(\.presentationMode) var presentationMode

	var body: some View {
		Button {
			print("Pressed")
			presentationMode.wrappedValue.dismiss()
		} label: {
			Image(systemName: "xmark")
				.foregroundColor(.white)
				.scaledToFit()
				.frame(width: 30, height: 30)
				.background(Color.gray.opacity(0.7))
				.clipShape(Circle())
				.shadow(radius: 5)
		}
	}
}

struct CrossButtonView_Previews: PreviewProvider {
	static var previews: some View {
		CrossButtonView()
	}
}
