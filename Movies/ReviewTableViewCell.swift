//
//  ReviewTableViewCell.swift
//  Movies
//
//  Created by Guilherme Trilha on 03/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    
    //MARK: Properties
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var userName: String = "" {
        didSet{
            userNameLabel.text = userName
        }
    }
    
    var reviewDescription: String = "" {
        didSet{
            descriptionLabel.text = reviewDescription
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
