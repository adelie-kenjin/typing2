
//
//  ViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/02/14.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let vc = TabBarViewController()
        vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(vc, animated: true,completion: nil)
    }

       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
   
}

