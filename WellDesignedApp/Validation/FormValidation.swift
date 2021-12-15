//
//  FormValidation.swift
//  WellDesignedApp
//
//  Created by Ant Colony on 15. 12. 2021..
//

import Foundation

class FormValidation {
    static func validateForm(registerForm: RegisterForm) -> ValidationMessage {
        
        var emtptyFields = [String]()
        
        if registerForm.name.isEmpty &&
           registerForm.surname.isEmpty &&
           registerForm.email.isEmpty &&
           registerForm.password.isEmpty &&
           registerForm.confirmPassword.isEmpty {
            return ValidationMessage(
                validation: false,
                message: "All fields are Empty!"
            )}
        
        if registerForm.name.isEmpty { emtptyFields.append("Name") }
        if registerForm.surname.isEmpty { emtptyFields.append("Surname") }
        if registerForm.email.isEmpty { emtptyFields.append("Email") }
        
        if !isValidEmail(registerForm.email) {
            return ValidationMessage(
                validation: false,
                message: "Email is not valid!"
            )}
        
        if registerForm.password.isEmpty { emtptyFields.append("Password") }
        
        if registerForm.password.count > 6 {
            return ValidationMessage(
                validation: false,
                message: "Password is too long!"
            )
        }
        
        if registerForm.confirmPassword.isEmpty { emtptyFields.append("Confirm password") }
        
        if !(registerForm.password == registerForm.confirmPassword) {
            return ValidationMessage(
                validation: false,
                message: "Passwords are not same!"
            )
        }
        
        if !emtptyFields.isEmpty {
            var fields = ""
            for field in emtptyFields {
                fields = fields + field + " "
            }
            return ValidationMessage(
                validation: false,
                message: fields + "fields are Empty"
            )
        }
        
        return ValidationMessage(
            validation: true,
            message: "Everything went okay!"
        )
    }
    
    static func validateForm(loginForm: LoginForm) -> ValidationMessage {
        
        if loginForm.password.isEmpty && loginForm.email.isEmpty {
            return ValidationMessage(
                validation: false,
                message: "Both fields are Empty!"
            )}
        
        if !isValidEmail(loginForm.email) {
            return ValidationMessage(
                validation: false,
                message: "Email is invalid!"
            )}
        
        if loginForm.password.count > 6 {
            return ValidationMessage(
                validation: false,
                message: "Password is too long!"
            )}
        
        if loginForm.password.isEmpty || loginForm.email.isEmpty {
            return ValidationMessage(
                validation: false,
                message: "Some fields are Empty!"
            )}
        
        return ValidationMessage(
            validation: true,
            message: "Everything went okay!"
        )
    }
    
    static func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            
            return emailPred.evaluate(with: email)
    }
    
}
