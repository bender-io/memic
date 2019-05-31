//
//  Meme.swift
//  Memic
//
//  Created by Brian Hersh on 5/30/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation

struct TopLevelJSON : Codable {
    let results : [Result]
}

struct Result : Codable {
    let media : [TinyGif]
}

struct TinyGif : Codable {
    let url : URL
}
