//
//  Person.swift
//  构造函数-01-必须参数M
//
//  Created by HLH on 16/9/14.
//  Copyright © 2016年 HLH. All rights reserved.
//

import UIKit
/*
构造函数 - 建立一个对象
1.给属性分配空间
2.设置初始值

swift 的构造函数都是init
重载:OC 中没有重载的概念

函数名相同 参数的个数和类型不同 交重载 是面向对象语言的必要标志

oc 中使用initWithXXX 的方式替代



*/


class Person: NSObject {
    
    var name: String
    var age: Int
    //重写默认的构造函数
    //父类提供了这个函数,而子类需要对父类的函数进行扩展 就叫做重写
    //特点: 可以super.xxx 调用父类本身的方法
    
    
    
    override init() {
        print("person init")
        name = "张三"
        age = 18
        super.init()
    }
    
    //重载的构造函数,只要是构造函数,就需要给属性设置初始值
    
    //注意:如果重写了构造函数,系统提供的默认的构造函数就不能被访问
    
    init(name:String,age: Int) {
        self.name = name;
        self.age = age
    }
    
    
}
