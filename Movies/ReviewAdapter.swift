//
//  ReviewAdapter.swift
//  Movies
//
//  Created by Guilherme Trilha on 05/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit
class ReviewAdapter: BaseTableViewAdapter<Review> {

    typealias ItemType = Review

    var listener : ReviewClickListener!

    init(listener: ReviewClickListener, tableView: UITableView, heightConstraint: NSLayoutConstraint) {
        super.init(tableView: tableView, heightConstraint: heightConstraint)
        self.listener = listener
    }

    public func setListener(listener: ReviewClickListener){
        self.listener = listener
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ReviewTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReviewTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ReviewTableViewCell.")
        }

        let review = itens[indexPath.row]
        
        cell.userName = review.userName ?? ""
        cell.reviewDescription = review.description ?? ""

        hideLastItemSeparator(indexPath: indexPath, cell: cell)
        resizeTableView()

        return cell
    }

    override func didSelectedItem(item: Review){
        self.listener.onReviewClicked(review: item)
    }
}

protocol ReviewClickListener {
    func onReviewClicked(review : Review)
}

