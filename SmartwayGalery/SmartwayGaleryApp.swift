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
	@StateObject var networkMonitor = NetworkMonitor()


    var body: some Scene {
        WindowGroup {
			GalleryView()
				.environmentObject(networkMonitor)
        }
    }
}


@objc class AppDelegate: NSObject, UIApplicationDelegate {
	func applicationWillTerminate(_ application: UIApplication) {
		ImageCacheService.shared.clearImageCache()
	}
}
