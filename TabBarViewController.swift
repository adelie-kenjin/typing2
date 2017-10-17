//
//  TabBarViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/06/20.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit
import AVFoundation

class TabBarViewController: UITabBarController,AVAudioPlayerDelegate {

    var util: Audio!
    
    var userDefaults:UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        util = Audio.shared
        

        // アイコンの色
        UITabBar.appearance().tintColor = UIColor(red: 255/255, green: 233/255, blue: 51/255, alpha: 1.0) // yellow
        
        // 背景色
        UITabBar.appearance().barTintColor = UIColor(red: 66/255, green: 74/255, blue: 93/255, alpha: 1.0) // grey black
        


        // Do any additional setup after loading the view.
    }
   /* override func viewDidAppear(_ animated: Bool) {
        self.dismiss(animated: true,completion: nil)
    }*/
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        util.playBGM(fileName: "troublesome")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        util.stopBGM()
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
