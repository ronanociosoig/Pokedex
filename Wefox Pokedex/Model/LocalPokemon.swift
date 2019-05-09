//
//  Pokemon.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let weight: Int
    let height: Int
    let spriteUrlString: String
    let date: Date
    
}
