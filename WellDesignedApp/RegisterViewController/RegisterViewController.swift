//
//  RegisterViewController.swift
//  ExtremellyWellDesigned
//
//  Created by Ant Colony on 9. 12. 2021..
//

import UIKit

class RegisterViewController: KeyboardHandlingBaseVC, UITextFieldDelegate {
    
    var registerForm = RegisterForm()
    
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
        // Do any additional setup after loading the view.
        print("RegisterViewController")
        setTextFields()
        Utils.setButton(button: createAccountButton)
        initializeScrollView(scrollView: registerScrollView)
    }
    
    private func formCheck() {
        registerForm.name = nameTextField.text ?? ""
        registerForm.surname = surnameTextField.text ?? ""
        registerForm.email = emailTextField.text ?? ""
        registerForm.password = passwordTextField.text ?? ""
        registerForm.confirmPassword = repeatPasswordTextField.text ?? ""
        
        let result = FormValidation.validateForm(registerForm: registerForm)
        
        if result.validation == false {
            sendAlert(title: "Bad Input", message: result.message)
        } else {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoggedInViewController") as! LoggedInViewController
            vc.email = registerForm.email
                            navigationController?.present(vc, animated: true)
        }
    }
    
    private func setTextFields() {
        nameTextField.delegate = self
        surnameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatPasswordTextField.delegate = self
        
        Utils.setTextView(textField: nameTextField, imageName: "personOutline_2", placeholder: "Name")
        Utils.setTextView(textField: surnameTextField, imageName: "personOutline_2", placeholder: "Surname")
        Utils.setTextView(textField: emailTextField, imageName: "email", placeholder: "Email")
        Utils.setTextView(textField: passwordTextField, imageName: "lock", placeholder: "• • • • • •")
        Utils.setTextView(textField: repeatPasswordTextField, imageName: "lock", placeholder: "Repeat password")
        
        passwordTextField.isSecureTextEntry = true
        repeatPasswordTextField.isSecureTextEntry = true
        if let iconImage = UIImage(named: "icon") {
            passwordTextField.rightSideImage = iconImage
        }
    }

}
