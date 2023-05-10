//
//  NetworkingService.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import Foundation
import UIKit
import Combine

class NetworkingService: NetworkingProtocol {

	func downloadData(from url: URL) -> AnyPublisher<[Photos],Error> {
		URLSession.shared.dataTaskPublisher(for: url)
			.receive(on: DispatchQueue.main)
			.tryMap(handleOutput)
			.decode(type: [Photos].self, decoder: JSONDecoder())
			.eraseToAnyPublisher()
	}

	private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
		guard let response = output.response as? HTTPURLResponse,
			  response.statusCode >= 200 && response.statusCode < 300 else{
			throw URLError(.badServerResponse)
		}
		return output.data
	}

	
	func fetchImage(from urlString: String) async -> UIImage? {

		guard let url = URL(string: urlString) else {
			return nil
		}

		do {
			let (data, response) = try await URLSession.shared.data(from: url)
			try handleResponse(response)
			return UIImage(data: data)

		} catch let error as NetworkingError {
			print(error)
			print("There was an error during data fetching! ", error.localizedDescription)
			return nil
		} catch {
			print("There was an error! ", error.localizedDescription)
			return nil
		}
	}
}
