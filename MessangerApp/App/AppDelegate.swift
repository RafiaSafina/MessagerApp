//
//  AppDelegate.swift
//  MessangerApp
//
//  Created by Рафия Сафина on 12.12.2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
//        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.rootViewController = LoginViewController()
        return true
    }
}
