//
//  UserDetailViewController.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 17/12/22.
//

import UIKit

class MasterViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    private let vm = UsersViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MasterTableViewCell", bundle: nil), forCellReuseIdentifier: "MasterTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        vm.users.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        fetchUsers()
    }
    @IBAction func userlogut(_ sender: Any) {
        performSegue(withIdentifier: "Login", sender: nil)
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
        return vm.users.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MasterTableViewCell", for: indexPath) as! MasterTableViewCell
        cell.user = self.vm.users.value[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailsViewController", sender:self.vm.users.value[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsViewController"{
            let vc = segue.destination as! DetailsViewController
            vc.userDetails = sender as? Usermodel
        }
    }
}


//Reading local json file
extension MasterViewController{
    private func fetchUsers(){
        if let url = Bundle.main.url(forResource: "local", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Usermodel].self, from: data)
                self.vm.users.value = jsonData
            } catch {
                print("error:\(error)")
            }
        }
    }
}
