//
//  CatchViewController.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

class CatchViewController: UIViewController {
    var presenter: CatchPresenting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

extension CatchViewController: CatchView {
    
}
