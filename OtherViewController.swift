//
//  OtherViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/07/26.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit
import AVFoundation

class OtherViewController: UIViewController ,AVAudioPlayerDelegate{

    var userDefaults:UserDefaults = UserDefaults.standard

    @IBOutlet var text: UILabel!
    @IBOutlet var volume: UISlider!
    @IBOutlet var volume1: UISlider!
  //  @IBOutlet var win:UILabel!
  //  @IBOutlet var lose:UILabel!
    
    let audio = Audio.shared
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        if let player = audio.BGM_audioPlayer {
             player.volume = sender.value
        }
        userDefaults.set(sender.value, forKey: "VOLUME")
    }
    
    @IBAction func sliderChanged1(_ sender1: UISlider){
        audio.SE_audioPlayer.volume = sender1.value

        userDefaults.set(sender1.value,forKey:"SEVOLUME")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let newVolume = userDefaults.object(forKey: "VOLUME") as? Float {
            volume.value = newVolume
        } else {
            volume.value = 0.5
        }
        if let newwVolume = userDefaults.object(forKey: "SEVOLUME") as? Float {
            volume.value = newwVolume
        } else {
            volume.value = 0.5
        }
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
      /*  if userDefaults.object(forKey: "WIN") != nil {
            win.text = String(userDefaults.object(forKey: "WIN")as! Int)
            print("userDefaultから表示")
        }else {
            win.text = "0回"
        }
        if userDefaults.object(forKey: "LOSE") != nil {
            lose.text = String(userDefaults.object(forKey: "LOSE") as! Int)
        }else {
            lose.text = "0回"
        }
        */
        
       // win.text = userDefaults.object(forKey: "WIN") as! String?
       // lose.text = userDefaults.object(forKey: "LOSE") as! String?
        
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
