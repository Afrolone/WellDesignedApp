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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController")
        setTextFields()
        // Do any additional setup after loading the view.
    }
    
    private func setTextFields() {
        Utils.setTextViews(textField: emailTextField, imageName: "email", placeholder: "Email")
        emailTextField.delegate = self
        Utils.setTextViews(textField: passwordTextField, imageName: "lock", placeholder: "Password")
        passwordTextField.delegate = self
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
