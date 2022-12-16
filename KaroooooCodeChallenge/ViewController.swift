//
//  ViewController.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 15/12/22.
//

import UIKit
class ViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var usernameTextField:TextFieldWithPadding!
    @IBOutlet weak var passwordTextField:TextFieldWithPadding!
    @IBOutlet weak var cityTextField:TextFieldWithPadding!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextfield()
    }
    @IBAction func submitLoginCredentails(_ sender: Any) {
        let validation = Validation()
        if (validation.isValidUsername(username: usernameTextField.text ?? "") == false){
            return
        }
        else if (validation.isValidatePassword(password:passwordTextField.text ?? "") == false){
            return
        }else{
            print(usernameTextField.text, passwordTextField.text)
        }
    }
}

extension ViewController{
    private func configureTextfield(){
        usernameTextField.layer.cornerRadius = 20.0
        passwordTextField.layer.cornerRadius = 20.0
        cityTextField.layer.cornerRadius = 20.0
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        self.cityTextField.delegate = self
    }
}
