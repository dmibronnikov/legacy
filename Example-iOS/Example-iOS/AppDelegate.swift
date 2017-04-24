//
// AppDelegate
// Example-iOS
//
// Created by Eugene Egorov on 24 April 2017.
// Copyright (c) 2017 Eugene Egorov. All rights reserved.
//

import UIKit
import EEUtilities

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
    ) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        self.window = window

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = mainStoryboard.instantiateInitialViewController()! as! UITabBarController

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        window.tintColor = tabBarController.view.tintColor

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }
}
