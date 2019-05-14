//
//  HomePresenter.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

protocol HomeView: class {
    
}

protocol HomePresenting: class {
    func ballButtonAction()
    func backpackButtonAction()
}

class HomePresenter: HomePresenting {
    
    // MARK: Properties
    
    private weak var view: HomeView?
    private var actions: HomeActions
    private var dataProvider: HomeDataProvider
    
    // MARK: Typealias
    
    typealias Actions = HomeActions
    typealias DataProvider = HomeDataProvider
    typealias View = HomeView
    
    required init(view: HomeView, actions: HomeActions, dataProvider: HomeDataProvider) {
        self.view = view
        self.actions = actions
        self.dataProvider = dataProvider
    }
    
    func ballButtonAction() {
        actions.ballButtonAction()
    }
    
    func backpackButtonAction() {
        actions.backpackButtonAction()
    }
}
