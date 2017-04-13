//
//  Movie.swift
//  Movies
//
//  Created by Guilherme Trilha on 30/03/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import Foundation
import ObjectMapper

public class Movie: Mappable {
    
    public var movieItem: MovieItem?
    public var cast = [Role]()
    public var fullDescription: String?
    public var reviews = [Review]()
    
    public init?(){
    
    }
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        movieItem <- map["item"]
        cast <- map["cast.roles"]
        fullDescription <- map["fullDescription"]
        reviews <- map["reviews"]
    }
}
