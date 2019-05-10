//
//  DataProviderTests.swift
//  Wefox PokedexTests
//
//  Created by Ronan on 10/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import XCTest

// swiftlint:disable all

@testable import Wefox_Pokedex

enum PokemonId: Int {
    case pokemon5 = 5
    case pokemon12 = 12
}

class DataProviderTests: XCTestCase {
    func testNewSpecies() {
        let dataProvider = DataProvider(service: MockServiceProvider())
        
        let pokemon5 = loadPokemon(identifier: .pokemon5)
        let pokemon12 = loadPokemon(identifier: .pokemon12)
        
        dataProvider.appData.pokemon = pokemon5
        dataProvider.catchPokemon()
        
        var newSpecies = dataProvider.newSpecies()
        
        XCTAssertFalse(newSpecies)
        
        dataProvider.appData.pokemon = pokemon12
        
        newSpecies = dataProvider.newSpecies()
        
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
