//
//  CKUserData.swift
//  Memic
//
//  Created by Brian Hersh on 5/28/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import Foundation
import CloudKit

class CKUserData {
    
    // MARK: - Singleton
    static let shared = CKUserData()
    
    let privateDB : CKDatabase = CKContainer.default().privateCloudDatabase
}
