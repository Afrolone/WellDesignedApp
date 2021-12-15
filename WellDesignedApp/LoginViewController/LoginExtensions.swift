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
