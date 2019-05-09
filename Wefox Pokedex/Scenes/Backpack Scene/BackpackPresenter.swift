//
//  BackpackPresenter.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

// swiftlint:disable weak_delegate

protocol BackpackView: class {
    
}

protocol BackpackPresenting: class {
    var dataSource: BackpackDataSource { get }
    var delegate: BackpackDelegate { get }
    func viewDidLoad()
}

class BackpackPresenter: BackpackPresenting {
    
    // MARK: Properties
    
    weak var view: BackpackView?
    var actions: BackpackActions
    var dataProvider: BackpackDataProvider
    var dataSource: BackpackDataSource
    var delegate: BackpackDelegate
    
    // MARK: Typealias
    
    typealias Actions = BackpackActions
    typealias DataProvider = BackpackDataProvider
    typealias View = BackpackView
    typealias DataSource = BackpackDataSource
    typealias Delegate = BackpackDelegate
    
    required init(actions: BackpackActions, dataProvider: BackpackDataProvider, view: BackpackView) {
        self.view = view
        self.actions = actions
        self.dataProvider = dataProvider
        delegate = BackpackDelegate()
        dataSource = BackpackDataSource()
   		delegate.presenter = self
        dataSource.presenter = self
    }
    
    func viewDidLoad() {
    
    }
}
