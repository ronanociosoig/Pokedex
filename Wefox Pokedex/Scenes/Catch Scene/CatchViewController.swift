//
//  CatchViewController.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit
import Haneke

class CatchViewController: UIViewController {
    var presenter: CatchPresenting?
    var pokemonView: PokemonView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let presenter = presenter else { return }
        presenter.viewDidLoad()
    }
    
    @IBAction func ballAction() {
        dismiss(animated: true) {
            // add the Pokemon to the backpack and store it.
        }
    }
}

extension CatchViewController: CatchView {
    func update() {
        guard let presenter = presenter else { return }
        guard let screenPokemon = presenter.pokemon() else { return }
        guard let pokemonView = PokemonView.loadFromNib() else { return }
        
        pokemonView.name.text = screenPokemon.name
        pokemonView.height.text = "Height: \(screenPokemon.height)"
        pokemonView.weight.text = "Weight: \(screenPokemon.weight)"
        view.addSubview(pokemonView)
        guard let path = screenPokemon.iconPath else { return }
        guard let imageURL = URL(string: path) else { return }
        
        pokemonView.imageView.hnk_setImage(from: imageURL)
        pokemonView.backgroundColor = UIColor.clear
        
        pokemonView.center = view.center
    }
}
