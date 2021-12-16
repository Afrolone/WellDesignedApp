//
//  FormValidation.swift
//  WellDesignedApp
//
//  Created by Ant Colony on 15. 12. 2021..
//

import Foundation

class FormValidation {
    static func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            
            return emailPred.evaluate(with: email)
    }
}
