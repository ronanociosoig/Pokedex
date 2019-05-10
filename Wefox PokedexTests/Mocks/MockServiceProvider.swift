//
//  MockServiceProvider.swift
//  Wefox PokedexTests
//
//  Created by Ronan on 10/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

// swiftlint:disable all

import Foundation
import Moya

@testable import Wefox_Pokedex

class MockServiceProvider: ServiceProvider {
    func makePokemonService() -> PokemonSearchLoadingService {
        return MockPokemonSearchService()
    }
}

class MockPokemonSearchService: PokemonSearchLoadingService {
    var provider: MoyaProvider<PokemonSearchEndpoint> {
        return MoyaProvider<PokemonSearchEndpoint>(stubClosure: MoyaProvider.immediatelyStub)
    }
    
    func search(identifier: Int, completion: @escaping (Data?, String?) -> Void) {
        let data = try! MockData.loadResponse()
        completion(data, nil)
    }
}
