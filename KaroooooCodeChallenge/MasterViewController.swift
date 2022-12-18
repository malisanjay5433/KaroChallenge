//
//  UserDetailViewController.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 17/12/22.
//

import UIKit

class MasterViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.title = "User Details"
        tableView.register(UINib(nibName: "MasterTableViewCell", bundle: nil), forCellReuseIdentifier: "MasterTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        let json = UserViewModel.init().readUser()
        print("json\(json)")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        viewWillAppear(true)
        getData { data in
            guard let data = data else { return }
            print(data)
        }
    }
}
extension MasterViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell", for: indexPath) as! MasterTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailsViewController", sender:indexPath.row)
    }
}
extension MasterViewController {
    private func getData(completion: @escaping(Usermodel?) -> Void) {
        readFromFile(fileName: "karoo", completion: completion)
    }
    
    private func readFromFile<T>(fileName: String, completion: @escaping (T?) -> Void) where T : Decodable {
        do {
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                completion(decodedData)
            }
        } catch (let error) {
            print(error)
        }
    }
}
