//
//  PokemonSearchService.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation

import Moya
import Result

protocol PokemonSearchLoadingService: class {
    var provider: MoyaProvider<PokemonSearchEndpoint> { get }
    
    func search(identifier: Int, completion: @escaping (_ data: Data?, _ error: String?) -> Void)
}

class PokemonSearchService: PokemonSearchLoadingService {
    var provider: MoyaProvider<PokemonSearchEndpoint> {
        if Configuration.uiTesting == true {
            return MoyaProvider<PokemonSearchEndpoint>(stubClosure: MoyaProvider.immediatelyStub)
        } else if Configuration.networkTesting {
            return MoyaProvider<PokemonSearchEndpoint>(plugins: [NetworkLoggerPlugin(verbose: true)])
        } else {
            return MoyaProvider<PokemonSearchEndpoint>(callbackQueue: DispatchQueue.global(qos: .background))
        }
    }
    
    func search(identifier: Int, completion: @escaping (_ data: Data?, _ error: String?) -> Void) {
        provider.request(.search(identifier: identifier)) { result in
            switch result {
            case .success(let response):
                
                if response.statusCode == 404 {
                    completion(nil, Constants.Translations.Error.statusCode404)
                    return
                }
                
                completion(response.data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
}
