//
//  Constants.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation

// swiftlint:disable nesting identifier_name

struct Constants {
    
    struct Network {
        static let baseUrlPath = "https://pokeapi.co/api/v2/"
        static let searchPath = "pokemon"
    }
    
    struct Translations {
        static let loading = "Loading"
        static let ok = "OK"
        static let cancel = "Cancel"
        static let close = "Close"
        
        struct HomeScene {
            static let catchTitle = "Catch a Pokemon"
        }
        
        struct CatchScene {
            static let weight = "Weight"
            static let height = "Height"
        }
        
        struct BackpackScene {
            static let title = "Backpack"
            static let closeButton = "Close"
        }
        
        struct DetailScene {
            static let weight = "Weight"
            static let height = "Height"
            static let date = "Date"
        }
    }
    
    struct PokemonAPI {
        static let minIdentifier = 1
        static let maxIdentifier = 1000
    }
}
