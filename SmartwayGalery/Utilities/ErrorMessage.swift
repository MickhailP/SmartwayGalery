//
//  ErrorMessage.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import Foundation

enum ErrorMessage: String, Error {
	case error
	case connectionLost
	case unknownError
	case invalidResponse
	case dataIsMissing
	case decodingError
	case encodingError
	case fetchingError
	case badURL

	var localised: String {
		NSLocalizedString(String(describing: Self.self) + "_\(rawValue)" , comment: "")
	}
}


