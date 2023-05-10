//
//  PhotoResponse.swift
//  SmartwayGallery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import Foundation


// MARK: - Photos
struct Photo: Decodable, Identifiable {
	let id, slug: String
	let createdAt, updatedAt: Date
	let width, height: Int
	let description, altDescription: String
	let urls: Urls
}


// MARK: - Urls
struct Urls: Codable {
	let raw, full, regular, small: String
	let thumb, smallS3: String
}
