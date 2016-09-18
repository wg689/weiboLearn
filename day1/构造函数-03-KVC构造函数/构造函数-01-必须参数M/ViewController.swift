//
//  ViewController.swift
//  构造函数-01-必须参数M
//
//  Created by HLH on 16/9/14.
//  Copyright © 2016年 HLH. All rights reserved.
//

import UIKit

//swift 中默认所有的变量和方法是全局共享的 不需要import 可以直接使用

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      let p = Student()
    print("\(p.name)---\(p.age)---\(p.no)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

