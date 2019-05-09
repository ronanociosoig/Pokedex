//
//  Wefox_PokedexTests.swift
//  Wefox PokedexTests
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import XCTest

@testable import Wefox_Pokedex

class Wefox_PokedexTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEndpointReturnsData() {
        
        let expectation = self.expectation(description: "No results in response data")
        
        let searchService = PokemonSearchService()
        
        searchService.search(identifier: 1) { (data, error) in
            if let error = error {
                print("Error: \(error)")
                XCTFail("Error in the server call")
                return
            }
            
            if let data = data {
                let length = data.count
                print("We have some data.: \(length)")
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testCanParsePokemon() {
        
    }
}
