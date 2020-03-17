//
//  MyButtonCell.swift
//  EurekaTextRow
//
//  Created by Hien Pham on 3/16/20.
//  Copyright © 2020 BraveSoft Vietnam. All rights reserved.
//

import UIKit
import Eureka

class MyButtonCell: ButtonCell {
    override func update() {
        super.update()
        selectionStyle = .none
        textLabel?.isHidden = true
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        row.didSelect()
    }
}
