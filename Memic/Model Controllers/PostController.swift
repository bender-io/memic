//
//  Post Controller.swift
//  Memic
//
//  Created by Brian Hersh on 5/30/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

class PostController {
    
    // MARK: - Source of Truth
    var posts : [Post]?
    
    // MARK: - Singleton
    static let shared = PostController()
    
    private init() {
        
    }
    
    
    
}
