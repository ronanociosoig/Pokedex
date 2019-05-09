//
//  BackpackWireframe.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

class BackpackWireframe {
    
    static func makeViewController() -> BackpackViewController {
        let storyboard = UIStoryboard.init(name: "BackpackViewController", bundle: nil)
        return BackpackViewController.instantiateFromStoryboard(storyboard: storyboard)
    }
    
    static func makeNavigationController() -> UINavigationController {
        let viewController = makeViewController()
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        viewController.title = "Backpack"
        
//        let navigationBarButton = UIBarButtonItem(title: Constants.Translations.cancel,
//                                                  style: .plain,
//                                                  target: navigationController,
//                                                  action: #selector(closeScene))
        
        let navigationBarButton = UIBarButtonItem(title: Constants.Translations.cancel,
                                                  style: .plain) { _ in
                                                    viewController.dismiss(animated: true, completion: nil)
        }
        
        viewController.navigationItem.leftBarButtonItem = navigationBarButton
        
        return navigationController
    }
    
    static func prepare(_ viewController: BackpackViewController, actions: BackpackActions, dataProvider: BackpackDataProvider) {
    	let presenter =  BackpackPresenter(actions: actions, dataProvider: dataProvider, view: viewController)
        viewController.presenter = presenter
    }
}

extension UINavigationController {
    @objc func closeScene() {
        self.dismiss(animated: true, completion: nil)
    }
}
