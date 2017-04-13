//
//  ReviewDataSource.swift
//  Movies
//
//  Created by Guilherme Trilha on 05/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit
class ReviewDataSource : BaseDataSource<Review> {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ReviewTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReviewTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ReviewTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let review = itens[indexPath.row]
        
        cell.userName = review.userName ?? ""
        cell.reviewDescription = review.description ?? ""
        return cell
    }

}
