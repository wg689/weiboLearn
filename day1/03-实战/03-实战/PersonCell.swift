//
//  PersonCell.swift
//  03-实战
//
//  Created by HLH on 16/9/14.
//  Copyright © 2016年 HLH. All rights reserved.
//

import UIKit

class PersonCell:UITableViewCell {
    var person:Person?{
        didSet {
            nameLable1.text = person?.name
            ageLable2.text = "\(person?.age ?? 0)"
            
        }
    }
    @IBOutlet weak var nameLable1: UILabel!
    @IBOutlet weak var ageLable2: UILabel!
}

