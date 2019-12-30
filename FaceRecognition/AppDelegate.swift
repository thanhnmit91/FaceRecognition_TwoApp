//
//  AppDelegate.swift
//  FaceRecognition
//
//  Created by administrator on 11/25/19.
//  Copyright © 2019 Vision. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let nav = UINavigationController(rootViewController: LoginVC())
        self.window?.rootViewController = nav
        
        return true
    }


}

