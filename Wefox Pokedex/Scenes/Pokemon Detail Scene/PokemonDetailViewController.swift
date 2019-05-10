//
//  PokemonDetailViewController.swift
//  Wefox Pokedex
//
//  Created by Ronan on 10/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    var presenter: PokemonDetailPresenting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

extension PokemonDetailViewController: PokemonDetailView {
    
}
