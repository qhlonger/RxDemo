//
//  ViewController.swift
//  RxDemo
//
//  Created by 江西华源 on 2018/10/10.
//  Copyright © 2018年 江西华源. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.present(DoubanListVC(), animated: true) {
            
        }
    }
}

