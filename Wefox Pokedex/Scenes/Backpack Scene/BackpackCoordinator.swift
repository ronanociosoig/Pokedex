
//
//  BackpackCoordinator.swift
//  Wefox Pokedex
//
//  Created by Ronan on 23/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//
import UIKit

class BackpackCoordinator: BaseCoordinator, ViewCoordinator {
    let rootViewController: UIViewController
    let dataProvider: BackpackDataProvider
    let actions: BackpackActions
    
    var viewController: UIViewController?
    var presenter: Updatable?
    
    init(rootViewController: UIViewController,
         actions: BackpackActions,
         dataProvider: BackpackDataProvider) {
        self.rootViewController = rootViewController
        self.dataProvider = dataProvider
        self.actions = actions
    }
    
    override func start() {
        let navigationController = BackpackWireframe.makeNavigationController()
        guard let viewController = navigationController.topViewController as? BackpackViewController else { return }
        
        self.viewController = navigationController
        self.presenter = viewController.presenter as? Updatable
        
        BackpackWireframe.prepare(viewController,
                                  actions: actions as BackpackActions,
                                  dataProvider: dataProvider as BackpackDataProvider)
    
        rootViewController.present(navigationController, animated: true, completion: nil)
    }
}
