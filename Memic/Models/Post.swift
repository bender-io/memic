//
//  Question.swift
//  Memic
//
//  Created by Brian Hersh on 5/30/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class Post {

    let username : String
    let timestamp : Date
    let question : String
    let profileImage : UIImage
    
    init(username: String, timestamp: Date = Date(), question: String, profileImage : UIImage = #imageLiteral(resourceName: "profile_pic")) {
        self.username = username
        self.timestamp = timestamp
        self.question = question
        self.profileImage = profileImage
    }
}
