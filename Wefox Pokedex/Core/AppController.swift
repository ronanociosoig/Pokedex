//
//  AppController.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation

protocol AppControlling {
    func start()
}

class AppController: AppControlling {
    var coordinator: Coordinating?
    
    func start() {
        let dataProvider = DataProvider(service: NetworkService())
        
        coordinator = Coordinator()
        coordinator?.dataProvider = dataProvider
        coordinator?.start()
    }
}
