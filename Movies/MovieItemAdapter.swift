//
//  MovieListDataSource.swift
//  Movies
//
//  Created by Guilherme Trilha on 04/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit

class MovieItemAdapter: BaseTableViewAdapter<MovieItem> {

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MovieTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MovieTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MovieTableViewCell.")
        }
        
        let movie = itens[indexPath.row]
        cell.setFieldValue(movieItem: movie)
        
        return cell
    }
}
