//
//  ViewController.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 15/12/22.
//

import UIKit
import TweeTextField
import Lottie
class LoginViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet weak var usernameTextField:TweeAttributedTextField!
    @IBOutlet weak var passwordTextField:TweeAttributedTextField!
    @IBOutlet weak var cityTextField:TweeAttributedTextField!
    @IBOutlet weak var lottieAnimation:LottieAnimationView!
    @IBOutlet weak var loginBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 8
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor  = UIColor.white.cgColor
        configureControls()
        configurelottieAnimation()
        usernameTextField.text = "sasssa"
        passwordTextField.text = "Shwetasas12"
        cityTextField.text = "mumbai"
    }
    @IBAction func submitLoginCredentails(_ sender: Any) {
        let validation = Validation()
        if (validation.isValidUsername(username: usernameTextField.text ?? "") == false){
            self.usernameTextField.infoLabel.text = "Username should be minimum 4 char"
            self.usernameTextField.infoLabel.font = UIFont.systemFont(ofSize:10, weight:.regular)
            self.usernameTextField.infoLabel.textColor = .red
            return
        }
        else if (validation.isValidatePassword(password:passwordTextField.text ?? "") == false){
            self.usernameTextField.infoLabel.text = ""
            self.passwordTextField.infoLabel.text = "Password should be minimum 6 char"
            self.passwordTextField.infoLabel.font = UIFont.systemFont(ofSize:10, weight:.regular)

            self.passwordTextField.infoLabel.textColor = .red
            return
        }else if(cityTextField.text?.isEmpty == true){
            self.passwordTextField.infoLabel.text = ""
            self.cityTextField.infoLabel.text = "Please select city name"
            self.cityTextField.infoLabel.font = UIFont.systemFont(ofSize:10, weight:.regular)
            self.cityTextField.infoLabel.textColor = .red
            return
        }else{
            self.usernameTextField.infoLabel.text = ""
            self.passwordTextField.infoLabel.text = ""
            self.cityTextField.infoLabel.text = ""
            performSegue(withIdentifier: "UserDetailViewController", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserDetailViewController"{
            
        }
    }
}

extension LoginViewController{
    private func configureControls(){
        usernameTextField.layer.cornerRadius = 8
        passwordTextField.layer.cornerRadius = 8
        cityTextField.layer.cornerRadius = 8
        
        usernameTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderWidth = 1.0
        cityTextField.layer.borderWidth = 1.0
        usernameTextField.layer.borderColor = UIColor.white.cgColor
        passwordTextField.layer.borderColor = UIColor.white.cgColor
        cityTextField.layer.borderColor = UIColor.white.cgColor
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
        self.cityTextField.delegate = self
        self.usernameTextField.textColor = .white
        self.passwordTextField.textColor = .white
        self.cityTextField.textColor = .white
    }
    private func configurelottieAnimation(){
        // 1. Set animation content mode
        lottieAnimation.contentMode = .scaleAspectFit
        // 2. Set animation loop mode
        lottieAnimation.loopMode = .loop
        // 3. Adjust animation speed
        lottieAnimation.animationSpeed = 0.7
        // 4. Play animation
        lottieAnimation.play()
    }
}
