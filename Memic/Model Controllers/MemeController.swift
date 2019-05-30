//
//  memeController.swift
//  Memic
//
//  Created by Brian Hersh on 5/30/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class MemeController {
    
    // MARK: - Source of Truth
    var memes : [Meme]?

    // MARK: - Singleton
    static let shared = MemeController()
    
    // MARK: - Fetch Functions
    func fetchMemeImage(searchTerm: String, completion: @escaping(UIImage?) -> Void) {
        
    }

}
