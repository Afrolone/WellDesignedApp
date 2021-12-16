//
//  LoginViewController.swift
//  ExtremellyWellDesigned
//
//  Created by Ant Colony on 9. 12. 2021..
//

import UIKit

class LoginViewController: KeyboardHandlingBaseVC {

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
        if !inputHasError() {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoggedInViewController") as! LoggedInViewController
            vc.email = emailTextField?.text
                            navigationController?.present(vc, animated: true)
        }
    }
    
    private func setTextFields() {
        setTextFieldDelegates()
        
        Utils.setTextView(textField: emailTextField, imageName: "email", placeholder: "Email" ,
            errorMessage: Constants.emailErr)
        Utils.setTextView(textField: passwordTextField, imageName: "lock", placeholder: "• • • • • •",
            errorMessage: Constants.passwordErr)
        
        passwordTextField.isSecureTextEntry = true
        if let iconImage = UIImage(named: "icon") {
            passwordTextField.rightSideImage = iconImage
        }
        
    }

}
