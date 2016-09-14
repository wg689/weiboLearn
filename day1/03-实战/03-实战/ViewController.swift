//
//  ViewController.swift
//  03-实战
//
//  Created by HLH on 16/9/14.
//  Copyright © 2016年 HLH. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    private var persons:[Person]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      loadData { (array) -> () in
        self.persons = array
        self.tableView.reloadData()

        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let detailVC = segue.destinationViewController as? DetailViewController else {
            return
        }
        
        //2. 获取用户当前选中行的数据
        guard let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
    
        
        //indexpath & detailVc 全部拿到
     print(persons![indexPath.row])
    detailVC.person = persons![indexPath.row]
    detailVC.didSaveCallBack = self.tableView.reloadData
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK: - 数据源方法
extension ViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("person -- \(persons?.count)")
        return persons?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath: indexPath) as! PersonCell
        print("cell\(indexPath.row)")
        cell.person = persons![indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
}



extension ViewController {
    private func loadData(completion:(array :[Person]) -> ()){
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
            print("耗时的操作")
            var dataList = [Person]()
            
            for i in 0..<50 {
                let name = "王舞\(i)"
                let age = random()%20 + 10
                let dict:[String:AnyObject] = ["name": name, "age": age]
                dataList.append(Person(dict: dict))
            }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                print("完成回调")
                completion(array: dataList)
            })
            
            
            
        }
    }

}


