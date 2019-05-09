//
//  CatchPresenter.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

protocol CatchView: class {
    func update()
}

protocol CatchPresenting: class {
    func viewDidLoad()
}

class CatchPresenter: CatchPresenting, Updatable {
    
    // MARK: Properties
    
    weak var view: CatchView?
    var actions: CatchActions
    var dataProvider: CatchDataProvider
    
    // MARK: Typealias
    
    typealias Actions = CatchActions
    typealias DataProvider = CatchDataProvider
    typealias View = CatchView
    
    required init(view: CatchView, actions: CatchActions, dataProvider: CatchDataProvider) {
        self.view = view
        self.actions = actions
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {
    
    }
    
    func update() {
        
    }
}
