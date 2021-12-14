//
//  LoginViewController.swift
//  ExtremellyWellDesigned
//
//  Created by Ant Colony on 9. 12. 2021..
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: DesignableUITextField!
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController")
        setTextFields()
        Utils.setButton(button: loginButton)
    }
    
    
    private func setTextFields() {
        Utils.setTextView(textField: emailTextField, imageName: "email", placeholder: "Email")
        emailTextField.delegate = self
        Utils.setTextView(textField: passwordTextField, imageName: "lock", placeholder: "• • • • • •")
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        //passwordTextField.text = "pass123"
        if let iconImage = UIImage(named: "icon") {
            passwordTextField.rightSideImage = iconImage
        }
    }

}
