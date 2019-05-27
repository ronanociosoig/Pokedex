//
//  Coordinator.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import Foundation
import JGProgressHUD

protocol Updatable {
    func update()
    func showError(message: String)
}

protocol Coordinating {
    var window: UIWindow { get }
    var dataProvider: DataProvider? { get set }
    
    func start()
    func showLoading()
    func dismissLoading()
    func showHomeScene()
    func showCatchScene()
    func showBackpackScene()
    func showPokemonDetailScene(pokemon: LocalPokemon)
    func showAlert(with errorMessage: String)
}

class Coordinator: BaseCoordinator, Coordinating {
    let window: UIWindow
    var dataProvider: DataProvider?
    var hud: JGProgressHUD?
    lazy var actions = Actions(coordinator: self)
    var presenter: Updatable?
    var currentViewController: UIViewController?
    
    override init() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
    }
    
    override func start() {
        actions.dataProvider = dataProvider
        
        showHomeScene()
    }
    
    func showHomeScene() {
        guard let dataProvider = dataProvider else { return }
        let homeCoordinator = HomeCoordinator(window: window,
                                              dataProvider: dataProvider as HomeDataProvider, actions: actions as HomeActions)
        coordinate(to: homeCoordinator)
    }
    
    func showCatchScene() {
        guard let dataProvider = dataProvider else { return }
        guard let topViewController = window.rootViewController else { return }
        
        let catchCoordinator = CatchCoordinator(rootViewController: topViewController,
                                                dataProvider: dataProvider as CatchDataProvider,
                                                actions: actions as CatchActions)
        coordinate(to: catchCoordinator)
        guard let viewController = catchCoordinator.viewController as? CatchViewController else {
            return
        }
        currentViewController = viewController
        presenter = viewController.presenter as? Updatable
        
        searchNextPokemon()
        showLoading()
    }
    
    func searchNextPokemon() {
        guard let dataProvider = dataProvider else { return }
        dataProvider.search(identifier: Generator.nextIdentifier())
    }
    
    func showBackpackScene() {
        guard let dataProvider = dataProvider else { return }
        guard let topViewController = window.rootViewController else { return }
        
        let backbackCoordinator = BackpackCoordinator(rootViewController: topViewController,
                                                      actions: actions as BackpackActions,
                                                      dataProvider: dataProvider as BackpackDataProvider)
        
        coordinate(to: backbackCoordinator)
        
        currentViewController = backbackCoordinator.viewController
        presenter = backbackCoordinator.presenter
    }
    
    func showPokemonDetailScene(pokemon: LocalPokemon) {
        
        guard let rootViewController = currentViewController else { return }
        
        let detailCoordinator = PokemonDetailCoordinator(rootViewController: rootViewController, pokemon: pokemon)
        
        coordinate(to: detailCoordinator)
    }
    
    func showLoading() {
        showHud(with: Constants.Translations.loading)
    }
    
    private func showHud(with message: String) {
        guard let viewController = currentViewController else { return }
        hud = JGProgressHUD(style: .dark)
        hud?.textLabel.text = message
        hud?.show(in: viewController.view)
    }
    
    func dismissLoading() {
        hud?.dismiss(animated: true)
        hud = nil
    }
    
    func showAlert(with message: String) {
        let alertController = UIAlertController(title: nil,
                                                message: message,
                                                preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: Constants.Translations.ok,
                                     style: .default,
                                     handler: nil)
        
        alertController.addAction(okButton)
        
        guard let viewController = currentViewController else { return }
        
        viewController.present(alertController,
                               animated: true,
                               completion: nil)
    }
}

extension Coordinator: Notifier {
    func dataReceived(errorMessage: String?, on queue: DispatchQueue?) {
        
        var localQueue = queue
        
        if localQueue == nil {
            localQueue = .global(qos: .userInteractive)
        }
        
        localQueue?.async {
            self.dismissLoading()
            
            if let errorMessage = errorMessage {
                if errorMessage == Constants.Translations.Error.statusCode404 {
                    self.presenter?.update()
                    return
                }
                self.presenter?.showError(message: errorMessage)
            } else {
                self.presenter?.update()
            }
        }
    }
}
