//
//  DescriptionViewController.swift
//  Movies
//
//  Created by Guilherme Trilha on 05/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    var movie = Movie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         movieDescriptionLabel.text = movie?.fullDescription ?? ""
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
