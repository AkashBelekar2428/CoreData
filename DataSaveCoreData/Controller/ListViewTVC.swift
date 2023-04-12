//
//  ListViewTVC.swift
//  DataSaveCoreData
//
//  Created by Akash Belekar on 12/04/23.
//

import UIKit

class ListViewTVC: UITableViewCell {
    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var cityLbl:UILabel!
    @IBOutlet weak var addressLbl:UILabel!
    @IBOutlet weak var mobileLbl:UILabel!
    
    var student:Student!{
        didSet{
            nameLbl.text = student.name
            cityLbl.text = student.city
            addressLbl.text = student.address
            mobileLbl.text = student.mobile
        }
       
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
