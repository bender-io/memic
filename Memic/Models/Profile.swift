//
//  Profile.swift
//  Memic
//
//  Created by Brian Hersh on 5/28/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class Profile {
    
    let firstName : String
    let lastName : String
    let username : String
    let password : String
    let email : String?
    
    init(firstName: String, lastName: String, username: String, password: String, email: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.username = username
        self.password = password
        self.email = email
    }
}
