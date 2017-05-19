//
//  ViewController.swift
//  swift-ProtocalExtension
//
//  Created by pony on 2017/5/19.
//  Copyright © 2017年 pony. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = .white
        let textf = UITextField(limit: 10, placeHolder: "aaa")
        textf.frame = CGRect(x: 20, y: 50, width: 200, height: 40)
        textf.backgroundColor = UIColor.lightGray
        self.view.addSubview(textf)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

