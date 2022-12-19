//
//  UserDetailViewController.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 17/12/22.
//

import UIKit

class MasterViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    var users = [Usermodel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MasterTableViewCell", bundle: nil), forCellReuseIdentifier: "MasterTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        let karoJSON = UserViewModel().readJSONFromFile(fileName:"local", type:[Usermodel].self) ?? []
        self.users = karoJSON
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
        return self.users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell", for: indexPath) as! MasterTableViewCell
        cell.user = self.users[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailsViewController", sender:self.users[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == ""{
            let vc = segue.destination as! DetailsViewController
            vc.userDetails = sender as? Usermodel
        }
    }
}
