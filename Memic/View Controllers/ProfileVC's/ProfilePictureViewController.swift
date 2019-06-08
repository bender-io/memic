//
//  ProfilePictureViewController.swift
//  Memic
//
//  Created by Brian Hersh on 6/8/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

// MARK: - Protocols
protocol ProfilePictureViewControllerDelegate : class {
    func profilePictureSelected(image: UIImage?)
}

class ProfilePictureViewController: UIViewController {

    // MARK: - Delegate
    weak var delegate : ProfilePictureViewControllerDelegate?
    
    
    @IBOutlet weak var changePhotoButtonText: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBAction func changePhotoButtonTapped(_ sender: Any) {
        presentImagePickerActionSheet()
    }
}

extension ProfilePictureViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)

        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            changePhotoButtonText.setTitle("", for: .normal)
            profileImage.image = image
            delegate?.profilePictureSelected(image: image)
        }
    }
    
    func presentImagePickerActionSheet() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let actionSheet = UIAlertController(title: "Take or Select Photo", message: nil, preferredStyle: .actionSheet)
        
        // Image from library:
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            actionSheet.addAction(UIAlertAction(title: "Library", style: .default, handler: { (_) in
                imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        }
        
        // Image from camera:
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
                imagePickerController.sourceType = UIImagePickerController.SourceType.camera
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        }
        
        // Cancel:
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
}
