//
//  MovieItem.swift
//  Movies
//
//  Created by Guilherme Trilha on 04/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import ObjectMapper

public class MovieItem: Mappable {
    
    public var id: Int?
    public var name: String?
    public var description: String?
   
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
    }
}
