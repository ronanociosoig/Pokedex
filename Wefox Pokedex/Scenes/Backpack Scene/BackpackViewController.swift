//
//  BackpackViewController.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

class BackpackViewController: UIViewController {
    var presenter: BackpackPresenting?
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        guard let presenter = presenter else { return }
        presenter.viewDidLoad()
    }
    
    private func setupCollectionView() {
        guard let presenter = presenter else { return }
        collectionView.delegate = presenter.delegate
        collectionView.dataSource = presenter.dataSource
        collectionView.reloadData()
    }
}

extension BackpackViewController: BackpackView {
    
}
