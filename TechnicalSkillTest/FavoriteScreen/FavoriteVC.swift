//
//  FavoriteVControlle.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 14/10/21.
//

import UIKit

class FavoriteVC: UICollectionViewController {
    
    private let reusableIdentifier = "groupCell"
    let viewModel = FavoriteVM()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reusableIdentifier)

        // Do any additional setup after loading the view.
    }


    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return viewModel.getFavoritesCount()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Setup Cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath) as? GroupCell else {
            return UICollectionViewCell()
        }
        
        cell.cellViewModel.group = viewModel.getFavorite(at: indexPath.row)
        cell.setupCell()
    
        return cell
    }

}
