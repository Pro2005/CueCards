//
//  AppDelegate.swift
//  CueCards
//
//  Created by Ilya Denisov on 11/15/17.
//  Copyright © 2017 Ilya Denisov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    lazy var appCoordinator = AppCoordinator(window)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        appCoordinator.start()
        return true
    }

}

