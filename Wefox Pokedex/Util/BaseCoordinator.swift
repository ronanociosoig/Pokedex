//
//  BaseCoordinator.swift
//  Wefox Pokedex
//
//  Created by Ronan on 23/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

protocol ViewCoordinator {
    var viewController: UIViewController? { get }
    var presenter: Updatable? { get }
}

class BaseCoordinator {
    func coordinate(to coordinator: BaseCoordinator) {
        return coordinator.start()
    }
    
    /// Starts job of the coordinator.
    ///
    /// - Returns: Result of coordinator job.
    func start() {
        fatalError("Start method should be implemented.")
    }
}
