//
//  PokemonDetailPresenter.swift
//  Wefox Pokedex
//
//  Created by Ronan on 10/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

protocol PokemonDetailView: class {
    func setPokemon(name: String)
}

protocol PokemonDetailPresenting: class {
    func weight() -> String
    func name() -> String
    func height() -> String
    func imagePath() -> String?
    
}

class PokemonDetailPresenter: PokemonDetailPresenting {
    
    // MARK: Properties
    private let pokemon: LocalPokemon
    private weak var view: PokemonDetailView?

    // MARK: Typealias
    typealias View = PokemonDetailView
    
    required init(view: PokemonDetailView, pokemon: LocalPokemon) {
        self.view = view
        self.pokemon = pokemon
    }
    
    func weight() -> String {
        return "\(Constants.Translations.DetailScene.weight): \(pokemon.weight)"
    }
    
    func height() -> String {
        return "\(Constants.Translations.DetailScene.height): \(pokemon.height)"
    }
    
    func name() -> String {
        return pokemon.name
    }
    
    func imagePath() -> String? {
        return pokemon.spriteUrlString
    }
}
