//
//  MovieListDataSource.swift
//  Movies
//
//  Created by Guilherme Trilha on 04/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import UIKit

class MovieItemDataSource : BaseDataSource<MovieItem> {
   
    
    var callback : MovieItemCallback!
    
    init(callback: MovieItemCallback) {
        self.callback = callback
    }
    
    public func setCallback(callback: MovieItemCallback){
        self.callback = callback
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MovieTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MovieTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MovieTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let movie = itens[indexPath.row]
        
        cell.movieName = movie.name ?? ""
        cell.movieDescription = movie.description ?? ""
        
        return cell
    }
}

protocol MovieItemCallback {
    func onMovieItensLoaded()
}
