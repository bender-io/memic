//
//  ProfileViewController.swift
//  Memic
//
//  Created by Brian Hersh on 5/29/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - Landing Pad
    var profile : Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        MemeController.shared.fetchGifURL(searchTerm: "excited") { (url) in
            print(url)
        }
    }
    
    func updateViews () {
        guard let profile = profile else { return }
        fullNameLabel.text = profile.firstName + " " + profile.lastName
        usernameLabel.text = profile.username
        emailLabel.text = profile.email
    }
}
