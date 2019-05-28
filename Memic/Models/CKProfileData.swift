//
//  CKUserData.swift
//  Memic
//
//  Created by Brian Hersh on 5/28/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit
import CloudKit

class CKProfileData {
    
    // MARK: - Singleton
    static let shared = CKProfileData()
    
    // MARK: - Databases
    let privateDB : CKDatabase = CKContainer.default().privateCloudDatabase
    let publicDB : CKDatabase = CKContainer.default().publicCloudDatabase
    
    // MARK: - Source of Truth
    var profiles : [Profile] = []
    
    private init() {
        
    }
    
    // MARK: - CRUD Functions
    func saveProfile() {
        print("saving profiles")
        
        let record = CKRecord(recordType: "Profiles")
        
        for profile in profiles {
            record.setObject(profile.username as CKRecordValue?, forKey: "username")
            record.setObject(profile.password as CKRecordValue?, forKey: "password")
            record.setObject(profile.firstName as CKRecordValue?, forKey: "firstName")
            record.setObject(profile.lastName as CKRecordValue?, forKey: "lastName")
            record.setObject(profile.email as CKRecordValue?, forKey: "email")
            privateDB.save(record) { (CKRecord, error) in
                if let error = error {
                    print("🥶 error saving profile record \(error)")
                }
                else { print("profile saved") }
            }
        }
    }
    
    func loadProfile() {
        profiles = []
        print("loading profiles")
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Profiles", predicate: predicate)
        privateDB.perform(query, inZoneWith: nil) { (records: [CKRecord]?, error: Error?) in
            if let error = error {
                print("🙁 error loading records \(error.localizedDescription)")
            }
            else {
                guard let records = records else { return }
                for record in records {
                    let username = record.object(forKey: "username") as! String
                    let password = record.object(forKey: "password") as! String
                    let firstName = record.object(forKey: "firstName") as? String
                    let lastName = record.object(forKey: "lastName") as? String
                    let email = record.object(forKey: "email") as? String
                    self.addProfile(username: username, password: password)
                }
            }
        }
    }
    
    func addProfile(username: String, password: String) {
        
    }
}
