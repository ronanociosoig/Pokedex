//
//  HomeActions.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//


protocol HomeActions {
    func ballButtonAction()
    func backpackButtonAction()
}

extension Actions: HomeActions {
    func ballButtonAction() {
        // show Catch Scene
        coordinator.showCatchScene()
    }
    
    func backpackButtonAction() {
        // show Backpack Scene
        coordinator.showBackpackScene()
    }
}
