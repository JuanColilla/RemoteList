//
//  ViewController.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 12/10/21.
//

import UIKit

class GroupsCollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = GroupsCollectionVM()
    
    private let reusableIdentifier = "groupCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Setup Cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusableIdentifier, for: indexPath) as? GroupCell else {
            return UICollectionViewCell()
        }
        
        cell.cellViewModel.group = viewModel.getGroup(index: indexPath.row)
        cell.setupCell()
    
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let groupDetailsVC = segue.destination as? GroupDetailsVC {
            if let cell = sender as? GroupCell {
                groupDetailsVC.viewModel.group = viewModel.getGroup(index: self.collectionView.indexPath(for: cell)?.row ?? 0)
            }
            
        }
    }

    private func loadData() {
        viewModel.fetchGroups {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

