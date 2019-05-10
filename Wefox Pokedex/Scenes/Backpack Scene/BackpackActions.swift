//
//  BackpackActions.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

protocol BackpackActions {
    func selectItem(at index: Int)
}

extension Actions: BackpackActions {
    func selectItem(at index: Int) {
        guard let dataProvider = dataProvider else { return }
        let pokemon = dataProvider.pokemon(at: index)
        coordinator.showPokemonDetailScene(pokemon: pokemon)
    }
}
