//
//  ViewController.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 15/12/22.
//

import UIKit
class ViewController: UIViewController {
    var users = [Usermodel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            let localJSON = UserViewModel.init().readJSONFromLocalFile(fileName: "Karoo", type: [Usermodel].self)
            print("localJSON : \(String(describing: localJSON))")
        }
    }
//    func loadJson(filename fileName: String) -> [Usermodel]? {
//        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode([Usermodel].self, from: data)
//                return jsonData
//            } catch {
//                print("error:\(error)")
//            }
//        }
//        return nil
//    }
}

