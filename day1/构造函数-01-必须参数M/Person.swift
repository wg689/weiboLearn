//
//  Person.swift
//  构造函数-01-必须参数M
//
//  Created by HLH on 16/9/14.
//  Copyright © 2016年 HLH. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String
    var age: Int
    
    override init() {
        print("person init")
        name = "张三"
        age = 18
        
        super.init()
        
        
    }
    
    
}
