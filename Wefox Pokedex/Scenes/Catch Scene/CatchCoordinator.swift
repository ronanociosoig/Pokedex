//
//  CatchCoordinator.swift
//  Wefox Pokedex
//
//  Created by Ronan on 23/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

class CatchCoordinator: BaseCoordinator, ViewCoordinator {
    private let rootViewController: UIViewController
    private let dataProvider: CatchDataProvider
    private let actions: CatchActions
    var viewController: UIViewController?
    var presenter: Updatable?
    
    init(rootViewController: UIViewController, dataProvider: CatchDataProvider, actions: CatchActions) {
        self.rootViewController = rootViewController
        self.dataProvider = dataProvider
        self.actions = actions
    }
    
    override func start() {
        let viewController = CatchWireframe.makeViewController()
        CatchWireframe.prepare(viewController, actions: actions, dataProvider: dataProvider)
        rootViewController.present(viewController, animated: true, completion: nil)
        self.viewController = viewController
        self.presenter = viewController.presenter as? Updatable
    }
}
