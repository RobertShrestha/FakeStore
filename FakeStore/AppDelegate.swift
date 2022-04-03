//
//  AppDelegate.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/2/22.
//

import UIKit
import SwiftyBeaver

let log = SwiftyBeaver.self
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: MainCoordinator?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Library manager
        let libsManager = LibsManager(window: window, application: application)
        libsManager.setupLibs()

        // MARK: Main Coordinator
        let navController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navController)
        coordinator?.start()

        // MARK: Manual launch of app
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        return true
    }
}

