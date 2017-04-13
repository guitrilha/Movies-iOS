//
//  MovieListViewController.swift
//  Movies
//
//  Created by Guilherme Trilha on 30/03/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper

class MovieListViewController : UITableViewController, MovieItemCallback{

    let delegate = UIApplication.shared.delegate as! AppDelegate
    var movieItemDataSource : MovieItemDataSource!
    
    var presenter : MovieListPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preparePresenter()
        
        movieItemDataSource = MovieItemDataSource(callback: self)
        
        prepareTableView()
    }
    
    private func preparePresenter(){
        presenter = MovieListPresenter(view: self)
        presenter.onResume()
    }
    
    private func prepareTableView(){
        tableView.dataSource = movieItemDataSource
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    public func fillIn(movies: [MovieItem]){
        movieItemDataSource.setItens(itens: movies)
        tableView.reloadData()
    }
    
    
    //MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "ShowMovieDetail":
            guard let movieDetailViewController = segue.destination as? MovieDetailViewController else{
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedMovieCell = sender as? MovieTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            guard let indexPath = tableView.indexPath(for: selectedMovieCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedMovie = movieItemDataSource.itens[indexPath.row]
            movieDetailViewController.movieItem = selectedMovie
            
        default:
            fatalError("Unexpected Segue Identifier \(segue.identifier)")
        }
        
    }
    
    func onMovieItensLoaded(){
        self.tableView.reloadData()
    }
    
    
    //MARK: Private Methods
    
 }
