//
//  HomeCoordinator.swift
//  Wefox Pokedex
//
//  Created by Ronan on 23/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

class HomeCoordinator: BaseCoordinator, ViewCoordinator {
    
    private let window: UIWindow
    private let dataProvider: HomeDataProvider
    private let actions: HomeActions
    var viewController: UIViewController?
    var presenter: Updatable?
    
    init(window: UIWindow, dataProvider: HomeDataProvider, actions: HomeActions) {
        self.window = window
        self.dataProvider = dataProvider
        self.actions = actions
    }
    
    override func start() {
        let viewController = HomeWireframe.makeViewController()
        HomeWireframe.prepare(viewController, actions: actions, dataProvider: dataProvider)
        window.rootViewController = viewController
        self.viewController = viewController
        self.presenter = viewController.presenter as? Updatable
    }
}
