//
//  RegisterExtensions.swift
//  WellDesignedApp
//
//  Created by Ant Colony on 15. 12. 2021..
//

import Foundation
import UIKit

extension RegisterViewController: UITextFieldDelegate {
    func setTextFieldDelegates() {
            nameTextField.delegate = self
            surnameTextField.delegate = self
            emailTextField.delegate = self
            passwordTextField.delegate = self
            repeatPasswordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
              nextField.becomeFirstResponder()
           } else {
              textField.resignFirstResponder()
           }
           return false
    }
}

extension RegisterViewController {
    func inputHasError() -> Bool {
        var hasError = false
        
        if nameTextField.text == nil || nameTextField?.text == "" {
            hasError = true
            nameTextField.toggleErrorStyle(error: true)
        } else {
            nameTextField.toggleErrorStyle(error: false)
        }
        
        if surnameTextField.text == nil || surnameTextField?.text == "" {
            hasError = true
            surnameTextField.toggleErrorStyle(error: true)
        } else {
            surnameTextField.toggleErrorStyle(error: false)
        }
        
        if let email = emailTextField?.text {
            if !FormValidation.isValidEmail(email) {
                hasError = true
                emailTextField.toggleErrorStyle(error: true)
            } else {
                emailTextField.toggleErrorStyle(error: false)
            }
        }
        
        if let password = passwordTextField?.text {
            
            var passwordHasError = false
            
            if (password.count > 6 || password.count == 0) {
                hasError = true
                passwordHasError = true
                passwordTextField.toggleErrorStyle(error: true)
            } else {
                passwordTextField.toggleErrorStyle(error: false)
            }
            
            if let confirmPassword = repeatPasswordTextField?.text {
                
                if confirmPassword == password {
                    if passwordHasError {
                        repeatPasswordTextField.toggleErrorStyle(error: true)
                    } else {
                        repeatPasswordTextField.toggleErrorStyle(error: false)
                    }
                } else {
                    repeatPasswordTextField.toggleErrorStyle(error: true)
                }
            }
        }
        

        
        return hasError
    }
}
