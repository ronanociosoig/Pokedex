//
//  PokemonDetailPresenter.swift
//  Wefox Pokedex
//
//  Created by Ronan on 10/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

protocol PokemonDetailView: class {
    
}

protocol PokemonDetailPresenting: class {
    func viewDidLoad()
}

class PokemonDetailPresenter: PokemonDetailPresenting {
    
    // MARK: Properties
    
    weak var view: PokemonDetailView?
    var actions: PokemonDetailActions
    var dataProvider: PokemonDetailDataProvider
    
    // MARK: Typealias
    
    typealias Actions = PokemonDetailActions
    typealias DataProvider = PokemonDetailDataProvider
    typealias View = PokemonDetailView
    
    required init(view: PokemonDetailView, actions: PokemonDetailActions, dataProvider: PokemonDetailDataProvider) {
        self.view = view
        self.actions = actions
        self.dataProvider = dataProvider
    }
    
    func viewDidLoad() {
    
    }
}
