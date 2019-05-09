//
//  Pokemon.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [Species]
    let gameIndices: [GameIndex]
    let height: Int
    let heldItems: [HeldItem]
    // swiftlint:disable identifier_name
    let id: Int
    // swiftlint:enable identifier_name
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let species: Species
    let sprites: Sprites
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int
}

struct Ability: Codable {
    let ability: Species
    let isHidden: Bool
    let slot: Int
}

struct Species: Codable {
    let name: String
    let url: String
}

struct GameIndex: Codable {
    let gameIndex: Int
    let version: Species
}

struct HeldItem: Codable {
    let item: Species
    let versionDetails: [VersionDetail]
}

struct VersionDetail: Codable {
    let rarity: Int
    let version: Species
}

struct Move: Codable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]
}

struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species
}

struct Sprites: Codable {
    let backDefault: String
    let backFemale: String?
    let backShiny: String
    let backShinyFemale: String?
    let frontDefault: String
    let frontFemale: String?
    let frontShiny: String
    let frontShinyFemale: String?
}

struct Stat: Codable {
    let baseStat, effort: Int
    let stat: Species
}

struct TypeElement: Codable {
    let slot: Int
    let type: Species
}
