//
//  PhotoResponse.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import Foundation


// MARK: - Photo
struct Photo: Decodable, Identifiable {
	let id = UUID()
	let apiId, slug: String
	let createdAt, updatedAt: String
	let width, height: Int
	let description, altDescription: String?
	let urls: Urls

	enum CodingKeys: String, CodingKey {
		case apiId = "id"
		case slug
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case width, height
		case description
		case altDescription = "alt_description"
		case urls
	}
}


// MARK: - Urls
struct Urls: Codable {
	let raw, full, regular, small: String
	let thumb, smallS3: String

	enum CodingKeys: String, CodingKey {
		case raw, full, regular, small, thumb
		case smallS3 = "small_s3"
	}
}

extension Photo {
	static let example = Photo(apiId: "22112", slug: "121231", createdAt: "2023-04-28T13:21:00Z", updatedAt: "2023-04-28T13:21:00Z", width: 8256, height: 5504, description: "Custom", altDescription: "Alter.", urls: urls)

	static let urls = Urls(
		raw: "https://images.unsplash.com/photo-1682687982502-1529b3b33f85?ixid=Mnw0NDYxODN8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4MzYyMDg5OA&ixlib=rb-4.0.3",
		full: "https://images.unsplash.com/photo-1682687982502-1529b3b33f85?crop=entropy&cs=srgb&fm=jpg&ixid=Mnw0NDYxODN8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4MzYyMDg5OA&ixlib=rb-4.0.3&q=85",
		regular: "https://images.unsplash.com/photo-1682687982502-1529b3b33f85?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0NDYxODN8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4MzYyMDg5OA&ixlib=rb-4.0.3&q=80&w=1080",
		small: "https://images.unsplash.com/photo-1682687982502-1529b3b33f85?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0NDYxODN8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4MzYyMDg5OA&ixlib=rb-4.0.3&q=80&w=400",
		thumb: "https://images.unsplash.com/photo-1682687982502-1529b3b33f85?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0NDYxODN8MXwxfGFsbHwxfHx8fHx8Mnx8MTY4MzYyMDg5OA&ixlib=rb-4.0.3&q=80&w=200",
		smallS3: "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1682687982502-1529b3b33f85")
}
