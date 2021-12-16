//
//  LoginExtensions.swift
//  WellDesignedApp
//
//  Created by Ant Colony on 15. 12. 2021..
//

import Foundation
import UIKit

extension LoginViewController: UITextFieldDelegate {
    func setTextFieldDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
              nextField.becomeFirstResponder()
           } else {
              // Not found, so remove keyboard.
              textField.resignFirstResponder()
           }
           return false
    }
}

extension LoginViewController {
    func inputHasError() -> Bool {
        var hasError = false
        
        if let email = emailTextField?.text {
            if !FormValidation.isValidEmail(email) {
                hasError = true
                emailTextField.toggleErrorStyle(error: true)
            } else {
                emailTextField.toggleErrorStyle(error: false)
            }
        }
        
        if let password = passwordTextField?.text {
            
            if (password.count > 6 || password.count == 0) {
                hasError = true
                passwordTextField.toggleErrorStyle(error: true)
            } else {
                passwordTextField.toggleErrorStyle(error: false)
            }
        }
        
        return hasError
    }
}
