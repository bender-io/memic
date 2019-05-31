//
//  SignUpViewController.swift
//  Memic
//
//  Created by Brian Hersh on 5/29/19.
//  Copyright © 2019 Brian Daniel. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: - Source of Truth
    var profile : Profile?
    
    // MARK: - IBOutlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
    }

    // MARK: - IBActions
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
    }
    
    // MARK: - CRUD Functions
    func signUpFlow() {
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
            
            self.profile = profile
            print(profile.firstName, profile.lastName, profile.username, profile.password, profile.email ?? "@gmail.com")
            
        } else { print("🥵 a text field is missing text") }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        signUpFlow()
        guard let profile = profile else { return }
        if segue.identifier == "signUpMemicTBC" {
            let tab = segue.destination as? UITabBarController
            let destinationVC = tab?.viewControllers?[2] as? ProfileViewController
            destinationVC?.profile = profile
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
