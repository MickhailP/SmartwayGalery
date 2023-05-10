//
//  NetworkingProtocol.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import Foundation
import UIKit
import Combine

protocol NetworkingProtocol {
	func downloadData(from url: URL) -> AnyPublisher<[Photos],Error>
	func fetchImage(from urlString: String) async -> UIImage?
}


extension NetworkingProtocol {

	/// Check if URLResponse have good status code, if it's not, it will throw an error
	/// - Parameter response: URLResponse from dataTask
	func handleResponse(_ response: URLResponse) throws {

		guard let response = response as? HTTPURLResponse else {
			throw NetworkingError.badURLResponse
		}

		if response.statusCode >= 200 && response.statusCode <= 300 {
			return
		} else {
			throw NetworkingError.error(response.statusCode)
		}
	}
}
