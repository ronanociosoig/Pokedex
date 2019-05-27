//
//  PokemonDetailCoordinator.swift
//  Wefox Pokedex
//
//  Created by Ronan on 27/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

class PokemonDetailCoordinator: BaseCoordinator, ViewCoordinator {
    let rootViewController: UIViewController
    let pokemon: LocalPokemon
    
    var viewController: UIViewController?
    var presenter: Updatable?
    
    init(rootViewController: UIViewController, pokemon: LocalPokemon) {
        self.rootViewController = rootViewController
        self.pokemon = pokemon
    }
    
    override func start() {
        let viewController = PokemonDetailWireframe.makeViewController()
        self.presenter = viewController.presenter as? Updatable
        
        PokemonDetailWireframe.prepare(viewController, pokemon: pokemon)
        
        guard let navigationController = rootViewController.navigationController else { return }
        navigationController.pushViewController(viewController, animated: true)
    }
}
