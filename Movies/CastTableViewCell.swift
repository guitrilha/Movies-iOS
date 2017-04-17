//
//  CastTableViewCell.swift
//  Movies
//
//  Created by Guilherme Trilha on 04/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var actorNameLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    func setFieldValue(role : Role){
        actorNameLabel.text = role.actorName ?? ""
        characterNameLabel.text = role.characterName ?? ""
    }
    
}
