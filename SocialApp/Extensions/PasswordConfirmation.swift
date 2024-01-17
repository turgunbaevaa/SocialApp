//
//  PasswordConfirmation.swift
//  SocialApp
//
//  Created by Aruuke Turgunbaeva on 17/1/24.
//

import UIKit

extension String {
    func isValidEmail(email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z}{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: email)
        return result
    }
    
    func isValidPassword(password: String) -> Bool{
        let passwordRegEx = "ˆ(?=.*[a-z])(?=.*[$@$#!%*&])[A-Za-z\\d$@$#!%*?&]{6,16}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        let result = passwordTest.evaluate(with: password)
        return result
    }
}
