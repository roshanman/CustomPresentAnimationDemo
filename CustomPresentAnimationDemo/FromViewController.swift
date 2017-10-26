//
//  FromViewController.swift
//  CustomPresentAnimationDemo
//
//  Created by ebt on 平成29-10-26.
//  Copyright © 平成29年 USTC. All rights reserved.
//

import UIKit

class FromViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self, #function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(self, #function)
    }
    
    override func viewDidDisappear(_ animated: Bool)  {
        print(self, #function)
    }
}

