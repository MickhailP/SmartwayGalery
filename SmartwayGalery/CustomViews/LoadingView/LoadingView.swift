//
//  LoadingView.swift
//  SmartwayGalery
//
//  Created by Миша Перевозчиков on 11.05.2023.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
		ZStack{
			Color.gray.opacity(0.4)

			VStack(spacing: 5) {
				if #available(iOS 15.0, *) {
					ProgressView()
						.tint(.blue)
						.scaleEffect(2)
				} else {
					ProgressView()
						.progressViewStyle(CircularProgressViewStyle(tint: .blue))
						.scaleEffect(2)
				}

				Text("Loading more content...")
			}
		}
		.ignoresSafeArea()
    }
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
