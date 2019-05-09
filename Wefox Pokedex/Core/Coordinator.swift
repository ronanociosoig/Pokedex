//
//  Coordinator.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation
import JGProgressHUD

protocol Updatable {
    func update()
}

protocol Coordinating {
    var dataProvider: DataProvider? { get set }
    
    func start()
    func showLoading()
    func dismissLoading()
    func showHomeScene()
    func showCatchScene()
    func showBackpackScene()
}

class Coordinator: Coordinating {
    let window: UIWindow
    var dataProvider: DataProvider?
    var hud: JGProgressHUD?
    lazy var actions = Actions(coordinator: self)
    var presenter: Updatable?
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
    }
    
    func start() {
        showHomeScene()
    }
    
    func showHomeScene() {
        guard let dataProvider = dataProvider else { return }
        let viewController = HomeWireframe.makeViewController()
        HomeWireframe.prepare(viewController, actions: actions as HomeActions, dataProvider: dataProvider as HomeDataProvider)
        
        window.rootViewController = viewController
    }
    
    func showCatchScene() {
        guard let dataProvider = dataProvider else { return }
        let viewController = CatchWireframe.makeViewController()
        
        CatchWireframe.prepare(viewController, actions: actions as CatchActions, dataProvider: dataProvider as CatchDataProvider)
        
        guard let topViewController = window.rootViewController else { return }
        
        topViewController.present(viewController, animated: true, completion: nil)
        
        presenter = viewController.presenter as? Updatable
    }
    
    func showBackpackScene() {
        guard let dataProvider = dataProvider else { return }
        
        let navigationController = BackpackWireframe.makeNavigationController()
        guard let viewController = navigationController.topViewController as? BackpackViewController else { return }
        
        BackpackWireframe.prepare(viewController,
                                  actions: actions as BackpackActions,
                                  dataProvider: dataProvider as BackpackDataProvider)
        
        guard let topViewController = window.rootViewController else { return }
        
        topViewController.present(navigationController, animated: true, completion: nil)
        
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

extension Coordinator: Notifier {
    func dataReceived(errorMessage: String?, on queue: DispatchQueue?) {
        // update the Catch scene
    }
}
