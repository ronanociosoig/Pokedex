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
    let pokemon: LocalPokemon
    weak var view: PokemonDetailView?

    // MARK: Typealias
    typealias View = PokemonDetailView
    
    required init(view: PokemonDetailView, pokemon: LocalPokemon) {
        self.view = view
        self.pokemon = pokemon
    }
    
    func viewDidLoad() {
    
    }
}
