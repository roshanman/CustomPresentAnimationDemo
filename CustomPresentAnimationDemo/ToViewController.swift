//
//  ToViewController.swift
//  CustomPresentAnimationDemo
//
//  Created by ebt on 平成29-10-26.
//  Copyright © 平成29年 USTC. All rights reserved.
//

import UIKit

class ToViewController: UIViewController {

    let manager = TransmitionManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        transitioningDelegate = manager
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func hidden(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(self, #function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(self, #function)
        
        manager.toViewController = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(self, #function)
    }
    
    override func viewDidDisappear(_ animated: Bool)  {
        print(self, #function)
    }
    
}
