//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Guilherme Trilha on 30/03/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    //MARK: Properties
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!

    var movieName: String = "" {
        didSet{
            movieNameLabel.text = movieName
        }
    }
    
    var movieDescription: String = "" {
        didSet{
            movieDescriptionLabel.text = movieDescription
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

