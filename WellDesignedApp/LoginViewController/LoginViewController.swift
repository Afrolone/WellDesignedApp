//
//  LoginViewController.swift
//  ExtremellyWellDesigned
//
//  Created by Ant Colony on 9. 12. 2021..
//

import UIKit

class LoginViewController: KeyboardHandlingBaseVC, UITextFieldDelegate {
    
    var loginForm: LoginForm = LoginForm()

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var emailTextField: DesignableUITextField!
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func onLogInTapped(_ sender: Any) {
        formCheck()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController")
        setTextFields()
        Utils.setButton(button: loginButton)
        initializeScrollView(scrollView: loginScrollView)
    }
    
    private func formCheck() {
        loginForm.email = emailTextField.text ?? ""
        loginForm.password = passwordTextField.text ?? ""
        
        let result = FormValidation.validateForm(loginForm: loginForm)
        
        if result.validation == false {
            sendAlert(title: "Bad Input", message: result.message)
        } else {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoggedInViewController") as! LoggedInViewController
            vc.email = loginForm.email
                            navigationController?.present(vc, animated: true)
        }
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
