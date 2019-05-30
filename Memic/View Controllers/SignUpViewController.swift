//
//  SignUpViewController.swift
//  Memic
//
//  Created by Brian Hersh on 5/29/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func setFieldsButtonTapped(_ sender: Any) {
        setTextFields()
    }
    
    // MARK: - CRUD Functions
    func setTextFields() {
        if let firstName = firstNameTextField.text, !firstName.isEmpty,
            let lastName = lastNameTextField.text, !lastName.isEmpty,
            let username = usernameTextField.text, !username.isEmpty,
            let password = passwordTextField.text, !password.isEmpty,
            let email = emailTextField.text, !email.isEmpty {
            
            let profile = Profile(firstName: firstName,
                                  lastName: lastName,
                                  username: username,
                                  password: password,
                                  email: email)
            
            ProfileController.shared.profile = profile
            print(profile.firstName, profile.lastName, profile.username, profile.password, profile.email ?? "@gmail.com")
            
        } else { print("🥵 a text field is missing text") }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let profile = ProfileController.shared.profile else { return }
        if segue.identifier == "signUpMemicTBC" {
            let tab = segue.destination as? UITabBarController
            let destinationVC = tab?.viewControllers?[2] as? ProfileViewController
            destinationVC?.profile = profile
        }
    }
}
