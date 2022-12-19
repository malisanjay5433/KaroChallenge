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
    var selectedCountry: String?
    var countryList = ["Algeria", "Australia","Brazil","Angola", "Canada", "Denmark","India", "Singapore","Russia"]
    let pickerView = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 8
        configureControls()
        configurelottieAnimation()
        usernameTextField.text = "sasssa"
        passwordTextField.text = "Shwetasas12"
        cityTextField.text = countryList[0]
        usernameTextField.textColor = .black
        passwordTextField.textColor = .black
        cityTextField.textColor = .black
        pickerView.delegate = self
        pickerView.dataSource = self
        cityTextField.inputView = pickerView
    }
    
    func dismissPickerView() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        cityTextField.inputAccessoryView = toolBar
    }
    @objc func action() {
        view.endEditing(true)
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
        }
        self.usernameTextField.infoLabel.text = ""
        self.passwordTextField.infoLabel.text = ""
        self.cityTextField.infoLabel.text = ""
        performSegue(withIdentifier: "UserDetailViewController", sender: nil)
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
        
        usernameTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        cityTextField.layer.borderColor = UIColor.black.cgColor
        
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
//extension LoginViewController : UIPickerViewDelegate{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1 // number of session
//    }
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return countryList.count // number of dropdown items
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return countryList[row] // dropdown item
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selectedCountry = countryList[row] // selected item
//        cityTextField.text = selectedCountry
//    }
//
//}
extension LoginViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countryList[row] // selected item
        cityTextField.text = selectedCountry
    }
}
