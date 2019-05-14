//
//  CatchPresenter.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

protocol CatchView: class {
    func update()
    func showLeaveOrCatchAlert()
    func showLeaveItAlert()
    func showNotFoundAlert()
}

protocol CatchPresenting: class {
    func pokemon() -> ScreenPokemon?
    func catchPokemonAction()
}

class CatchPresenter: CatchPresenting, Updatable {

    // MARK: Properties
    
    private weak var view: CatchView?
    private var actions: CatchActions
    private var dataProvider: CatchDataProvider
    
    // MARK: Typealias
    
    typealias Actions = CatchActions
    typealias DataProvider = CatchDataProvider
    typealias View = CatchView
    
    required init(view: CatchView, actions: CatchActions, dataProvider: CatchDataProvider) {
        self.view = view
        self.actions = actions
        self.dataProvider = dataProvider
    }
    
    func update() {
        guard let view = view else { return }
        view.update()
        
        if pokemon() == nil {
            view.showNotFoundAlert()
            return
        }
        
        dataProvider.newSpecies() ? view.showLeaveOrCatchAlert() : view.showLeaveItAlert()
    }
    
    func pokemon() -> ScreenPokemon? {
        return dataProvider.pokemon()
    }
    
    func catchPokemonAction() {
        actions.catchPokemon()
    }
}
