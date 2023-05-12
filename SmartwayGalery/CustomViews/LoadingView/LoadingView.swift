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
			VStack {
				ProgressView()
					.scaleEffect(2)
					.tint(.blue)
					.padding(.bottom, 5)
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
