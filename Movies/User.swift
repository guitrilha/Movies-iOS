//
//  User.swift
//  Movies
//
//  Created by Guilherme Trilha on 29/03/17.
//  Copyright © 2017 Guilherme Trilha. All rights reserved.
//

import Foundation

public class User {

    public var userName: String
    public var password: String
    public var token: String
    
    convenience init?(json: [String: Any?]) {
        guard let userName = json["userName"] as? String,
            let password = json["password"] as? String,
            let token = json["token"] as? String
            else{
                return nil
        }
        self.init(userName: userName, password: password, token: token)
    }
    
    init(userName: String, password: String, token: String){
        self.userName = userName
        self.password = password
        self.token = token
    }

}
