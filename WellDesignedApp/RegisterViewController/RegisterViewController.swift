//
//  RegisterViewController.swift
//  ExtremellyWellDesigned
//
//  Created by Ant Colony on 9. 12. 2021..
//

import UIKit

class RegisterViewController: KeyboardHandlingBaseVC {
    
    
    @IBOutlet weak var registerScrollView: UIScrollView!
    
    @IBOutlet weak var nameTextField: DesignableUITextField!
    @IBOutlet weak var surnameTextField: DesignableUITextField!
    @IBOutlet weak var emailTextField: DesignableUITextField!
    @IBOutlet weak var passwordTextField: DesignableUITextField!
    @IBOutlet weak var repeatPasswordTextField: DesignableUITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    @IBAction func onCreateAccountTapped(_ sender: Any) {
        formCheck()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RegisterViewController")
        setTextFields()
        Utils.setButton(button: createAccountButton)
        initializeScrollView(scrollView: registerScrollView)
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
        
        Utils.setTextView(textField: nameTextField, imageName: "personOutline_2",placeholder: "Name",
                          errorMessage: Constants.nameErr)
        Utils.setTextView(textField: surnameTextField, imageName: "personOutline_2", placeholder: "Surname",
                          errorMessage: Constants.surnameErr)
        Utils.setTextView(textField: emailTextField, imageName: "email", placeholder: "Email",
                          errorMessage: Constants.emailErr)
        Utils.setTextView(textField: passwordTextField, imageName: "lock", placeholder: "• • • • • •",
                          errorMessage: Constants.passwordErr)
        Utils.setTextView(textField: repeatPasswordTextField, imageName: "lock", placeholder: "Repeat password",
                          errorMessage: Constants.confirmPasswordErr)
        
        passwordTextField.isSecureTextEntry = true
        repeatPasswordTextField.isSecureTextEntry = true
        if let iconImage = UIImage(named: "icon") {
            passwordTextField.rightSideImage = iconImage
            repeatPasswordTextField.rightSideImage = iconImage
        }
    }

}
