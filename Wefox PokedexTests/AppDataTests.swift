//
//  AppDataTests.swift
//  Wefox PokedexTests
//
//  Created by Ronan on 10/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

// swiftlint:disable all

import XCTest

@testable import Wefox_Pokedex

class AppDataTests: XCTestCase {
    enum PokemonId: Int {
        case pokemon5
        case pokemon12
    }
    
    func testNewSpecies() {
        let appData = AppData()
        let pokemon5 = loadPokemon(identifier: .pokemon5)
        let pokemon12 = loadPokemon(identifier: .pokemon12)
        
        appData.pokemon = pokemon5
        let localPokemon = PokemonParser.parse(pokemon: pokemon5)
        appData.pokemons.append(localPokemon)
        
        var newSpecies = appData.newSpecies()
        
        XCTAssertFalse(newSpecies)
        
        appData.pokemon = pokemon12
        
        newSpecies = appData.newSpecies()
        
        XCTAssertTrue(newSpecies)
    }
    
    func loadPokemon(identifier: PokemonId) -> Pokemon {
        let data: Data
        
        switch identifier {
        case .pokemon5:
            data = try! MockData.loadResponse()!
        case .pokemon12:
            data = try! MockData.loadOtherResponse()!
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let pokemon = try! decoder.decode(Pokemon.self, from: data)
        return pokemon
    }
}
