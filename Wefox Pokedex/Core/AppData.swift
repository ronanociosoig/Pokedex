//
//  AppData.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation

class AppData {
    static let pokemonFile = "pokemons.json"
    
    var pokemon: Pokemon?
    var pokemons = [LocalPokemon]()
    
    func newSpecies() -> Bool {
        guard let pokemon = pokemon else { return false }
        
        if pokemons.isEmpty {
            return true
        }
        
        let foundSpecies = pokemons.filter {
            $0.species == pokemon.species.name
        }
        
        return foundSpecies.isEmpty
    }
    
    func load() {
        if Storage.fileExists(AppData.pokemonFile, in: directory()) {
            pokemons = Storage.retrieve(AppData.pokemonFile, from: directory(), as: [LocalPokemon].self)
        }
    }
    
    func save() {
        Storage.store(pokemons, to: directory(), as: AppData.pokemonFile)
    }
    
    func directory() -> Storage.Directory {
        if Configuration.uiTesting == true {
            return .caches
        }
        return .documents
    }
    
    func sortByOrder() {
        pokemons.sort(by: {
            $0.order < $1.order
        })
    }
}
