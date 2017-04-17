//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by Guilherme Trilha on 31/03/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper

class MovieDetailViewController : UIViewController, UITableViewDelegate, ReviewClickListener {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var reviewsTable: UITableView!
    @IBOutlet weak var castTable: UITableView!

    @IBOutlet weak var reviewsTableHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var castTableHeightConstraint: NSLayoutConstraint!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    
    var castAdapter: CastAdapter!
    var reviewAdapter: ReviewAdapter!
    
    var movieItem : MovieItem?
    
    var movie = Movie(){
        didSet{
            reviewAdapter.setItens(itens: [Review]())
            reviewsTable.reloadData()
            reviewAdapter.setItens(itens: (movie?.reviews)!)
            reviewsTable.reloadData()
            castAdapter.setItens(itens: (movie?.cast)!)
            castTable.reloadData()
        }
    }

    
    
    private lazy var descriptionViewController: DescriptionViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
        viewController.movie = self.movie!
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var reviewsViewController: ReviewsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "ReviewsViewController") as! ReviewsViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    


    
    override func viewDidLoad() {

        navigationItem.title = movieItem?.name

        reviewAdapter = ReviewAdapter(listener: self, tableView: reviewsTable, heightConstraint: reviewsTableHeightConstraint)
        reviewsTable.delegate = reviewAdapter
        reviewsTable.dataSource = reviewAdapter

        castAdapter = CastAdapter(tableView: castTable, heightConstraint: castTableHeightConstraint)
        castTable.delegate = castAdapter
        castTable.dataSource = castAdapter

        loadMovie(movieItem: movieItem!)
        
        segmentedControl.selectedSegmentIndex = 0
        updateView()
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        updateView()
    }
    
    //MARK: Private Methods
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        viewContainer.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = viewContainer.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    private func updateView() {
        if segmentedControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: reviewsViewController)
            add(asChildViewController: descriptionViewController)
        } else {
            remove(asChildViewController: descriptionViewController)
            add(asChildViewController: reviewsViewController)
        }
    }
    
    
    private func loadMovie(movieItem: MovieItem){
        let tokenParameter : String = (delegate.user?.token) ?? "NO_TOKEN"
        let parameters : Parameters = ["token": tokenParameter]
        
        let baseUrl :String = "http://localhost:8080"
        let requestPath :String = "/movies/\(movieItem.id!)"
        
        Alamofire.request(baseUrl.appending(requestPath), method: .get, parameters : parameters, encoding: URLEncoding.queryString).validate().responseJSON { response in
            switch response.result {
            case .success:
                self.onMovieLoaded(resultValue: response.result.value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func onMovieLoaded(resultValue: Any?){
        if resultValue is [String: Any]{
            movie = Mapper<Movie>().map(JSONObject: resultValue as! [String: Any])!
        } else {
            print("Didn`t get movie as JSON from API")
            return
        }
    }

    func onReviewClicked(review : Review){
        print(review.description)
    }
}
