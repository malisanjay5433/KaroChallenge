//
//  MasterTableViewCell.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 18/12/22.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
    @IBOutlet weak var usernameLbl:UILabel!
    @IBOutlet weak var emailLbl:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    var user: Usermodel?{
        didSet{
            self.usernameLbl.text = user?.username ?? ""
            self.emailLbl.text = user?.email ?? ""
        }
    }
}
