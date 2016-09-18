//
//  Student.swift
//  构造函数-01-必须参数M
//
//  Created by HLH on 16/9/14.
//  Copyright © 2016年 HLH. All rights reserved.
//

import UIKit

class Student: Person {
    var no: String

    override init(){
        print("student init")
        no = "001"
        super.init()
    }
}