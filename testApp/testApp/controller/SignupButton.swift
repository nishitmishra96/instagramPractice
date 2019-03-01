//
//  SignupButton.swift
//  testApp
//
//  Created by Himanshu on 26/02/19.
//  Copyright © 2019 craterzone. All rights reserved.
//

import UIKit

class SignupButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clear
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor(red: 40/255.0, green: 127/255.0, blue: 240/255.0, alpha: 1).cgColor
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(red: 40.0/255.0, green: 127.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        self.setTitleColor(UIColor.white, for: .normal)
        self.setTitle("Sign up", for: .normal)
    }

}
