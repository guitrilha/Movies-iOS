//
//  Role.swift
//  Movies
//
//  Created by Guilherme Trilha on 04/04/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import Foundation
import ObjectMapper

public class Role: Mappable {
    
    public var actorName: String?
    public var characterName: String?
    
    public required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        actorName <- map["actor.name"]
        characterName <- map["character.name"]
    }
}
