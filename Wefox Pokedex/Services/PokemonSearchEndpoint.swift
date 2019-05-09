//
//  PokemonSearchEndpoint.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation
import Moya

enum PokemonSearchEndpoint {
    case search(identifier: Int)
}

extension PokemonSearchEndpoint: TargetType {
    // swiftlint:disable force_unwrapping
    var baseURL: URL {
        return URL(string: Constants.Network.baseUrlPath)!
    }
    // swiftlint:enable force_unwrapping
    
    var path: String {
        switch self {
        case .search(let identifier):
            return Constants.Network.searchPath + "/\(identifier)/"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .search:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
}
