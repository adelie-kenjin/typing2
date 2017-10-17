//
//  CounterViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/07/14.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit

class CounterViewController: UIViewController {
    @IBOutlet var label: UILabel!
    
    var count: Int = 3
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 3
        label.text = String(count)
        
        if !timer.isValid {
            //タイマーが作動していない場合作動させる　!は否定の意味
            timer = Timer.scheduledTimer(timeInterval: 1,
                    target: self,
                    selector: #selector(self.up),
                    userInfo: nil,
                    repeats: true
            )
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        count = 3
        label.text = String(count)
        
        if !timer.isValid {
            //タイマーが作動していない場合作動させる　!は否定の意味
            timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
    }
    func up(){
        count = count - 1
        label.text = String(count)
        
        if count == 3{
            label.textColor = UIColor.green

        }else if count == 2{
            label.textColor = UIColor.blue

        }else if count == 1{
            label.textColor = UIColor.red

        }else if count <= 0{
            
           // performSeguewithIdentifier("type" ,sender: nil)
            if timer.isValid {
                //タイマーが作動していた場合停止する
                timer.invalidate()
            }
            count = 3
            
            self.performSegue(withIdentifier: "type", sender: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
