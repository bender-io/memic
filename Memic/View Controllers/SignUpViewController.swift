//
//  SignUpViewController.swift
//  Memic
//
//  Created by Brian Hersh on 5/29/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - Properties
    var profilez : Profile?
    
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
    @IBAction func signUpButtonTapped(_ sender: Any) {
        signUp()
    }
    
    // MARK: - CRUD Functions
    func signUp() {
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
            
            profilez = profile
            print(profile.firstName, profile.lastName, profile.username, profile.password, profile.email ?? "@gmail.com")
            
        } else { print("🥵 a text field is missing text") }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard profilez != nil else { return }
        if segue.identifier == "signUpMemicTBC" {
            let destinationVC = segue.destination as? ProfileViewController
            let profile = profilez
            destinationVC?.profile = profile
        }
    }
}
