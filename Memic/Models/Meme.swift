//
//  Meme.swift
//  Memic
//
//  Created by Brian Hersh on 5/30/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

struct Meme : Codable {
    let image : String
    let like : Int
    let rank : Rank
    
    enum Rank : String, Codable {
        case gold
        case silver
        case bronze
        case none
    }
}