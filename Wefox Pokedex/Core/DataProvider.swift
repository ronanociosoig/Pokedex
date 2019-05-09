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
}

class DataProvider: DataProviding {
    let appData = AppData()
    var notifier: Notifier?
    let networkService: ServiceProvider
    
    required init(service: ServiceProvider) {
        self.networkService = service
    }
    
    func search(identifier: Int) {
        let searchService = networkService.makePokemonService()
        
        searchService.search(identifier: identifier) { (data, errorMessage) in
            let queue = DispatchQueue.main
            
            if let errorMessage = errorMessage {
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
}
