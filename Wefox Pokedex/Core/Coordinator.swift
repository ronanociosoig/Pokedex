//
//  Coordinator.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation
import JGProgressHUD

protocol Coordinating {
    func start()
    func showLoading()
    func dismissLoading()
    func showHomeScene()
}

class Coordinator: Coordinating {
    let window: UIWindow
    var dataProvider: DataProvider?
    var appController: AppController
    var hud: JGProgressHUD?
    
    init(appController: AppController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.appController = appController
    }
    
    func start() {
        showHomeScene()
    }
    
    func showHomeScene() {
        
    }
    
    func showLoading() {
        showHud(with: Constants.Translations.loading)
    }
    
    private func showHud(with message: String) {
        
        guard let topViewController = window.rootViewController else { return }
        
        hud = JGProgressHUD(style: .dark)
        hud?.textLabel.text = message
        hud?.show(in: topViewController.view)
    }
    
    func dismissLoading() {
        hud?.dismiss(animated: true)
        hud = nil
    }
}
