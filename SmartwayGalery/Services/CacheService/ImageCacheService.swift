//
//  ImageCacheService.swift
//  SmartwayGalery
//
//  Created by Миша Перевозчиков on 11.05.2023.
//

import Foundation
import UIKit

final class ImageCacheService {

	static let shared = ImageCacheService()
	private init () { }

	var photoCache: NSCache<NSString, UIImage> = {
		var cache = NSCache<NSString, UIImage>()
		cache.countLimit = 200
		cache.totalCostLimit = 1024 * 1024 * 100 //100 MB
		return cache
	}()

	func add(key: String, value: UIImage) {
		photoCache.setObject(value, forKey: key as NSString)
	}

	func get(key: String) -> UIImage? {
		photoCache.object(forKey: key as NSString)
	}
}

