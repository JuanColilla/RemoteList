//
//  GroupCell.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 13/10/21.
//

import Foundation
import UIKit

class GroupCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var groupImageView: UIImageView!
    
    // MARK: Properties
    let cellViewModel = GroupCellVM()
    
    // MARK: Methods
    
    func setupCell() {
        nameLabel.text = cellViewModel.getName()
        shortDescriptionLabel.text = cellViewModel.getShortDescription()
        groupImageView.asyncLoadImage(from: cellViewModel.getImageURL())
        
        nameLabel.backgroundColor = UIColor(white: 1, alpha: 0.7)
        dateLabel.backgroundColor = UIColor(white: 1, alpha: 0.7)
        shortDescriptionLabel.backgroundColor = UIColor(white: 1, alpha: 0.7)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        groupImageView.image = nil
    }
}
