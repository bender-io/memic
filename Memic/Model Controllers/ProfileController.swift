//
//  ProfileController.swift
//  Memic
//
//  Created by Brian Hersh on 5/28/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

class ProfileController {
    
    // MARK: - Source of Truth
    var profile : Profile?
    
    // MARK: - Singleton
    static let shared = ProfileController()
    
    private init() {
        
    }
    
}
