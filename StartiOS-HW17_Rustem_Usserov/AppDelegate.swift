//
//  AppDelegate.swift
//  StartiOS-HW17_Rustem_Usserov
//
//  Created by Rustem on 02.06.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: CardsViewController())
        window?.makeKeyAndVisible()
        return true
    }
}

