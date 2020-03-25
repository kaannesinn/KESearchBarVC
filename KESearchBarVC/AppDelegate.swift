//
//  AppDelegate.swift
//  KESearchBarVC
//
//  Created by Kaan Esin on 4.02.2020.
//  Copyright © 2020 Kaan Esin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        }
        return true
    }


}

