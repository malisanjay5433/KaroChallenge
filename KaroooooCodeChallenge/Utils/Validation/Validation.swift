//
//  File.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 15/12/22.
//

import Foundation
class Validation{
    public func isValidUsername(username:String) -> Bool {
        let RegEx = "\\A\\w{4,12}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: username)
    }
    public func isValidatePassword(password: String) -> Bool {
        //Minimum 8 characters at least 1 Alphabet and 1 Number:
        let passRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{4,}$"
        let trimmedString = password.trimmingCharacters(in: .whitespaces)
        let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        let isvalidatePass = validatePassord.evaluate(with: trimmedString)
        return isvalidatePass
    }
}
//struct LoginValidation {
//    func Validate(loginRequest: LoginRequest) -> ValidationResult{
//        if(loginRequest.userName!.isEmpty){
//            return ValidationResult(success: false, error: "User pame is empty")
//        }
//        if(loginRequest.userPassword!.isEmpty){
//            return ValidationResult(success: false, error: "User password is empty")
//        }
//        if(loginRequest.cityName!.isEmpty){
//            return ValidationResult(success: false, error: "City Name is empty")
//        }
//        return ValidationResult(success: true, error: nil)
//    }
//    
//}
struct ValidationResult{
    let success: Bool
    let error : String?
}
