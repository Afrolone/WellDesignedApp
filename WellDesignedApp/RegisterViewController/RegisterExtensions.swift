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
