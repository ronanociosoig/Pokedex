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
            guard let presenter = self.presenter else { return }
            presenter.catchPokemonAction()
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
    
    func leavePokemonAction() {
        dismiss(animated: true, completion: nil)
    }
    
    func showLeaveOrCatchAlert() {
        let alertController = UIAlertController(title: Constants.Translations.CatchScene.leaveOrCatchAlertMessageTitle,
                                                message: nil,
                                                preferredStyle: .alert)
        
        let leaveButton = UIAlertAction(title: Constants.Translations.CatchScene.leaveItButtonTitle,
                                        style: .default) { _ in
                                            self.leavePokemonAction()
        }
        
        let catchButton = UIAlertAction(title: Constants.Translations.CatchScene.catchItButtonTitle,
                                        style: .default,
                                        handler: nil)
        
        alertController.addAction(leaveButton)
        alertController.addAction(catchButton)
        present(alertController,
                               animated: true,
                               completion: nil)
    }
    
    func showLeaveItAlert() {
        let alertController = UIAlertController(title: Constants.Translations.CatchScene.alreadyHaveItAlertMessageTitle,
                                                message: nil,
                                                preferredStyle: .alert)
        
        let leaveButton = UIAlertAction(title: Constants.Translations.CatchScene.leaveItButtonTitle,
                                        style: .default) { _ in
                                            self.leavePokemonAction()
        }
        
        alertController.addAction(leaveButton)
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    func showNotFoundAlert() {
        let alertController = UIAlertController(title: Constants.Translations.CatchScene.noPokemonFoundAlertTitle,
                                                message: nil,
                                                preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: Constants.Translations.ok,
                                        style: .default) { _ in
                                            self.leavePokemonAction()
        }
        
        alertController.addAction(okButton)
        present(alertController,
                animated: true,
                completion: nil)
    }
}
