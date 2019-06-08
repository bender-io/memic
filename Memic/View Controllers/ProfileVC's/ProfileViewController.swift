//
//  ProfileViewController.swift
//  Memic
//
//  Created by Brian Hersh on 5/29/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: Properties
    var profilePicture : UIImage = #imageLiteral(resourceName: "profile_pic.jpg")
    
    // MARK: - IBOutlets
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // MARK: - Landing Pad
    var profile : Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews () {
        guard let profile = profile else { return }
        fullNameLabel.text = profile.firstName + " " + profile.lastName
        usernameLabel.text = profile.username
        emailLabel.text = profile.email
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfilePictureVC" {
            let destinationVC = segue.destination as? ProfilePictureViewController
            destinationVC?.delegate = self
        }
    }
}

extension ProfileViewController : ProfilePictureViewControllerDelegate {
    
    func profilePictureSelected(image: UIImage?) {
        guard let image = image else { return }
        
        profilePicture = image
        
    }
}
