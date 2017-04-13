//
//  Review.swift
//  Movies
//
//  Created by Guilherme Trilha on 31/03/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import Foundation
import ObjectMapper

public class Review : Mappable {
    
    public var userName: String?
    public var rating: Int?
    public var description: String?
    
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        userName <- map["userName"]
        rating <- map["star.value"]
        description <- map["description"]
    }
}
