//
//  GroupDetailsVC.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 14/10/21.
//

import UIKit

class GroupDetailsVC: UIViewController {
    
    
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    @IBOutlet weak var favoriteGroupImageView: UIImageView!
    @IBOutlet weak var groupDescriptionTextField: UITextView!
    
    @IBAction func heartTapped(_ sender: UITapGestureRecognizer) {
        if favoriteGroupImageView.image == UIImage(named: "heart") {
            favoriteGroupImageView.image = UIImage(named: "heart.fill")
            viewModel.saveGroupToFavorites()
        } else {
            favoriteGroupImageView.image = UIImage(named: "heart")
            viewModel.deleteFavorite()
        }
    }
    
    let viewModel = GroupDetailsVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = viewModel.group?.name
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        groupImageView.asyncLoadImage(from: viewModel.group?.defaultImageURL ?? "")
        nameLabel.text = viewModel.group?.name
        dateLabel.text = "\(viewModel.group?.date ?? 0)"
        shortDescriptionLabel.text = viewModel.group?.descriptionShort
        groupDescriptionTextField.text = viewModel.group?.groupDescription
        
        nameLabel.backgroundColor = UIColor(white: 1, alpha: 0.7)
        dateLabel.backgroundColor = UIColor(white: 1, alpha: 0.7)
        shortDescriptionLabel.backgroundColor = UIColor(white: 1, alpha: 0.7)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
