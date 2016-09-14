//
//  ViewController.swift
//  02-闭包的循环演练
//
//  Created by HLH on 16/9/14.
//  Copyright © 2016年 HLH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //定义完成的回调属性
    //闭包的返回值可选
    var finishCallBack:((html: String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData { [weak self](html) -> () in
            print(html)
            print(self?.view)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData(finished: (html:String) -> ()){
        finishCallBack = finished
        
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            print("模拟异步加载数据")
            dispatch_async(dispatch_get_main_queue()
            , { () -> Void in
                print("回到主线程回调")
                self.finishCallBack?(html: "回来了")
            })
        }
    }


}

