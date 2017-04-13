//
//  MovieListPresenter.swift
//  Movies
//
//  Created by Guilherme Trilha on 05/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import Alamofire
import ObjectMapper

class MovieListPresenter {
    
    
    private var view : MovieListViewController
    
    init(view: MovieListViewController) {
        self.view = view
    }
    
    public func onResume(){
        loadMovies()
    }
    
    
    public func loadMovies(){
        let tokenParameter : String = (view.delegate.user?.token) ?? "NO_TOKEN"
        let parameters : Parameters = ["token": tokenParameter]
        
        let baseUrl :String = "http://localhost:8081"
        let requestPath :String = "/movies"
        
        Alamofire.request(baseUrl.appending(requestPath), method: .get, parameters : parameters, encoding: URLEncoding.queryString).validate().responseJSON { response in
            switch response.result {
            case .success:
                self.onMoviesLoaded(resultValue: response.result.value)
            case .failure(let error):
                print(error)
            }
        }

        
    }
    
    private func onMoviesLoaded(resultValue: Any?){
        var movies = [MovieItem]()
        if resultValue is Array<AnyObject>{
            for jsonObject in resultValue as! Array<AnyObject> {
                let movieItem : MovieItem = Mapper<MovieItem>().map(JSONObject: jsonObject as! [String: Any])!
                movies.append(movieItem)
            }
        } else {
            print("Didn`t get movies as JSON from API")
            return
        }
        onMoviesLoaded(movies: movies)
    }
    
    private func onMoviesLoaded(movies: [MovieItem]){
        view.fillIn(movies : movies)
    }
    
    
}


