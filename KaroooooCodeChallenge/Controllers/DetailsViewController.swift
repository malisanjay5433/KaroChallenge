//
//  DetailsViewController.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 18/12/22.
//

import UIKit
import Lottie
class DetailsViewController: UIViewController {
    @IBOutlet weak var locationTap:UILabel!
    @IBOutlet weak var lottieAnimation:LottieAnimationView!
    var userDetails: Usermodel?
    
    //UserInfo Personal Labels here
    @IBOutlet weak var usernameLbl:UILabel!
    @IBOutlet weak var emailLbl:UILabel!
    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var phoneLbl:UILabel!
    @IBOutlet weak var websiteLbl:UILabel!

    //Address Labels here
    @IBOutlet weak var streetLbl:UILabel!
    @IBOutlet weak var suiteLbl:UILabel!
    @IBOutlet weak var cityLbl:UILabel!
    @IBOutlet weak var zipcodeLbl:UILabel!

    
    //Company Labels here
    @IBOutlet weak var companyNameLbl:UILabel!
    @IBOutlet weak var catchPhraseLbl:UILabel!
    @IBOutlet weak var bsLbl:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizerSearch = UITapGestureRecognizer(target: self, action: #selector(tapMap(tapGestureRecognizer:)))
        locationTap.isUserInteractionEnabled = true
        locationTap.addGestureRecognizer(tapGestureRecognizerSearch)
        configurelottieAnimation()
        displayAllLabelData()
    }
    
    @objc func tapMap(tapGestureRecognizer: UITapGestureRecognizer){
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "Map", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Map"{
            let vc = segue.destination as! UserLocationViewController
            vc.userDetails  = self.userDetails
        }
    }
}

extension DetailsViewController{
    private func configurelottieAnimation(){
        // 1. Set animation content mode
        lottieAnimation.contentMode = .scaleAspectFit
        // 2. Set animation loop mode
        lottieAnimation.loopMode = .loop
        // 3. Adjust animation speed
        lottieAnimation.animationSpeed = 1.0
        //play in the background
        lottieAnimation.backgroundBehavior = .pauseAndRestore
        // 4. Play animation
        lottieAnimation.play()
    }
    private func displayAllLabelData(){
        self.usernameLbl.text = "Username : \(userDetails?.username ?? "")"
        self.nameLbl.text = "Name : \(userDetails?.name ?? "")"
        self.emailLbl.text = "Email : \(userDetails?.email ?? "")"
        self.websiteLbl.text = "Website : \(userDetails?.website ?? "")"
        self.phoneLbl.text = "Phone : \(userDetails?.phone ?? "")"
        
        self.streetLbl.text = "Street : \(userDetails?.address?.street ?? "")"
        self.suiteLbl.text = "Suite : \(userDetails?.address?.suite ?? "")"
        self.cityLbl.text = "City : \(userDetails?.address?.city ?? "")"
        self.zipcodeLbl.text = "Zipcode : \(userDetails?.address?.zipcode ?? "")"

        self.companyNameLbl.text = "Name : \(userDetails?.company?.name ?? "")"
        self.catchPhraseLbl.text = "Phrase : \(userDetails?.company?.catchPhrase ?? "")"
        self.bsLbl.text = "BS : \(userDetails?.company?.bs ?? "")"
    }
}
