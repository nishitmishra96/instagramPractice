//
//  myCell.swift
//  tableView
//
//  Created by Himanshu on 27/02/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {

    @IBOutlet weak var testText: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
