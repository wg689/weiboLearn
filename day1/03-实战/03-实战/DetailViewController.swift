//
//  DetailViewController.swift
//  03-实战
//
//  Created by HLH on 16/9/14.
//  Copyright © 2016年 HLH. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var didSaveCallBack: (()->())?
    
    var person:Person?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    
    @IBAction func textChange() {
        navigationItem.rightBarButtonItem?.enabled = nameText.hasText() && ageText.hasText()
        
    }
    @IBAction func save(sender: AnyObject) {
        person?.name = nameText.text
        person?.age = Int(ageText.text!) ?? 0
        print(person)
        didSaveCallBack?()
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.text = person?.name
        ageText.text = "\(person?.age ?? 0)"
        
        textChange()
        
    }
    
    
    
}
