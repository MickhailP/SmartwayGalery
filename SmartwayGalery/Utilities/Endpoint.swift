//
//  Endpoints.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import Foundation


enum Endpoint {
	case photoList(page: Int)
}


extension Endpoint {

	var host: String { "api.unsplash.com" }

	var path: String {
		switch self {
			case .photoList:
				return "/photos"
		}
	}

	var queryItems: [String: String]? {
		switch self {
			case .photoList(let page):
				return ["page": "\(page)"]
		}
	}
}


extension Endpoint {
	var url: URL? {
		var components = URLComponents()
		components.scheme = "https"
		components.host = host
		components.path = path

		var queryItems = queryItems?.compactMap{ URLQueryItem(name: $0.key, value: $0.value) }
		queryItems?.append( URLQueryItem(name: "client_id", value: APIToken.clientID))

		components.queryItems = queryItems

		return components.url
	}
}
