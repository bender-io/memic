//
//  Question.swift
//  Memic
//
//  Created by Brian Hersh on 5/30/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class Post {
    
    let profileImage : UIImage
    let username : String
    let timestamp : Date
    let memes : [Meme]?
    
    init(profileImage : UIImage = #imageLiteral(resourceName: "profile_pic"), username: String, timestamp: Date = Date(), memes: [Meme]?) {
        self.profileImage = profileImage
        self.username = username
        self.timestamp = timestamp
        self.memes = memes
    }
}
