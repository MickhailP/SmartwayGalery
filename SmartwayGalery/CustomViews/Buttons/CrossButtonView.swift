//
//  CrossButtonView.swift
//  SmartwayGalery
//
//  Created by Миша Перевозчиков on 10.05.2023.
//

import SwiftUI

struct CrossButtonView: View {

	@Environment(\.dismiss) var dismiss

	var body: some View {
		Button {
			dismiss()
		} label: {
			Image(systemName: "xmark")
				.font(.headline)
				.foregroundColor(.primary)
				.padding(5)
				.background(.ultraThickMaterial)
				.clipShape(Circle())
				.shadow(radius: 5)
				.padding()
		}
    }
}

struct CrossButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CrossButtonView()
    }
}
