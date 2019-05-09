//
//  BackpackDataSource.swift
//  Wefox Pokedex
//
//  Created by Ronan on 09/05/2019.
//  Copyright © 2019 Sonomos. All rights reserved.
//

import UIKit

class BackpackDataSource: NSObject, UICollectionViewDataSource {
    
    weak var presenter: BackpackPresenting?
    
    func register(collectionView: UICollectionView) {
        collectionView.register(cellType: PokemonCollectionViewCell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
