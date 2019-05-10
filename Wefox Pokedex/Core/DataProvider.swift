//
//  DataProvider.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation
import os.log

struct Log {
    static var general = OSLog(subsystem: "com.sonomos.InTune", category: "general")
    static var network = OSLog(subsystem: "com.sonomos.InTune", category: "network")
    static var data = OSLog(subsystem: "com.sonomos.InTune", category: "data")
}

protocol DataProviding {
    init(service: ServiceProvider)
    
    func search(identifier: Int)
    func catchPokemon()
    func newSpecies() -> Bool
    func pokemon(at index: Int) -> LocalPokemon
}

class DataProvider: DataProviding {
    let appData = AppData()
    var notifier: Notifier?
    private let networkService: ServiceProvider
    
    required init(service: ServiceProvider) {
        self.networkService = service
        appData.load()
        appData.sortByOrder()
    }
    
    func search(identifier: Int) {
        let searchService = networkService.makePokemonService()
        
        appData.pokemon = nil
        
        searchService.search(identifier: identifier) { (data, errorMessage) in
            let queue = DispatchQueue.main
            
            if let errorMessage = errorMessage {
                if errorMessage == Constants.Translations.Error.statusCode404 {
                    self.notifier?.dataReceived(errorMessage: errorMessage, on: queue)
                    return
                }
                
                os_log("Error message: %s", log: Log.network, type: .error, errorMessage)
                return
            }
            
            guard let data = data else {
                os_log("Error message: %s", log: Log.network, type: .error, Constants.Translations.Error.noDataError)
                self.notifier?.dataReceived(errorMessage: Constants.Translations.Error.noDataError, on: queue)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let pokemon = try decoder.decode(Pokemon.self, from: data)
                self.appData.pokemon = pokemon
                self.notifier?.dataReceived(errorMessage: nil, on: queue)
                os_log("Success: %s", log: Log.network, type: .default, "Loaded")
            } catch {
                let errorMessage = "\(error)"
                os_log("Error: %s", log: Log.data, type: .error, errorMessage)
                self.notifier?.dataReceived(errorMessage: errorMessage, on: queue)
            }
        }
    }
    
    func catchPokemon() {
        guard let pokemon = appData.pokemon else { return }
        let localPokemon = PokemonParser.parse(pokemon: pokemon)
        appData.pokemons.append(localPokemon)
        appData.sortByOrder()
        appData.save()
    }
    
    func newSpecies() -> Bool {
        return appData.newSpecies()
    }
    
    func pokemon(at index: Int) -> LocalPokemon {
        return appData.pokemons[index]
    }
}
