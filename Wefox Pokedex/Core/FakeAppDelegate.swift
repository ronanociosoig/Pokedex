//
//  FakeAppDelegate.swift
//  Wefox Pokedex
//
//  Created by Ronan on 27/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

class FakeAppDelegate: UIResponder, UIApplicationDelegate {
    
    private let appController = AppController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appController.start()
        
        return true
    }
}
