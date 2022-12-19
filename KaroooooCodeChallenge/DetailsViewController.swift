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
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizerSearch = UITapGestureRecognizer(target: self, action: #selector(tapMap(tapGestureRecognizer:)))
        locationTap.isUserInteractionEnabled = true
        locationTap.addGestureRecognizer(tapGestureRecognizerSearch)
        configurelottieAnimation()
        print("userDetails : \(userDetails)")
    }
    
    @objc func tapMap(tapGestureRecognizer: UITapGestureRecognizer){
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "Map", sender: nil)
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
        // 4. Play animation
        lottieAnimation.play()
    }
}
