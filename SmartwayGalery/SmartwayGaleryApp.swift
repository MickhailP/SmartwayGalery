//
//  SmartwayGaleryApp.swift
//  SmartwayGalery
//
//  Created by Миша Перевозчиков on 09.05.2023.
//

import SwiftUI


@main
struct SmartwayGaleryApp: App {

	@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
			GalleryView()
        }
    }
}


@objc class AppDelegate: NSObject, UIApplicationDelegate {
	func applicationWillTerminate(_ application: UIApplication) {
		ImageCacheService.shared.clearCache()
	}
}
