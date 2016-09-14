//
//  Person.swift
//  03-实战
//
//  Created by HLH on 16/9/14.
//  Copyright © 2016年 HLH. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    var name: String?
    var age:Int = 0
    init(dict: [String: AnyObject]){
    super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override var description: String {
        let keys = ["name","age"]
        
        return "\(dictionaryWithValuesForKeys(keys))"
    }
    
    
}
