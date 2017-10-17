//
//  GacharesultViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/06/28.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit
import AVFoundation

class GacharesultViewController: UIViewController,AVAudioPlayerDelegate {

    @IBOutlet var attack:UILabel!
    @IBOutlet var name:UILabel!
    @IBOutlet var image:UIImageView!
    
    var util : Audio!
    
    var charadata = CharaData()
    
    var getArray: [Bool] = [false,false,false,false,false,false,false]
    
    var random:Int!
    
    var userDefaults:UserDefaults = UserDefaults.standard
    
    var charaArray:[String] = []
    
    var charaPower:[Int] = [Int]()
    
    var chara:String!
    
    var power:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    /*    if userDefaults.object(forKey: "GET") != nil {
            getArray = userDefaults.object(forKey: "GET") as! [Bool]
        }*/
        var imageArray = charadata.chara
        
        if userDefaults.array(forKey: "CHARA") != nil {
            charaArray = userDefaults.array(forKey: "CHARA") as! [String]
        }
        
        if userDefaults.array(forKey: "GET") != nil {
            getArray = userDefaults.array(forKey: "GET") as! [Bool]
        }
        
       // chara = charaArray.count + 1
       // userDefaults.set(chara, forKey: "CHARA")

        random = Int(arc4random_uniform(UInt32(imageArray.count)))
        name.text = imageArray[random]
        
        
        chara = name.text
        charaArray.append(chara)
        userDefaults.set(charaArray, forKey: "CHARA")
        
        if random == 0 {
            getArray[random] = true
            image.image = UIImage(named:imageArray[random]+".png")
            attack.text = String(charadata.charaPower[random])
            
            power = attack.text
            charaArray.append(power)
            userDefaults.set(charaPower, forKey: "POWER")
        }else if random == 1 {
            getArray[random] = true
            image.image = UIImage(named:imageArray[random]+".png")
            attack.text = String(charadata.charaPower[random])
            power = attack.text
            charaArray.append(power)
            userDefaults.set(charaPower, forKey: "POWER")
        }else if random == 2 {
            getArray[random] = true
            image.image = UIImage(named:imageArray[random]+".png")
            attack.text = String(charadata.charaPower[random])
            power = attack.text
            charaArray.append(power)
            userDefaults.set(charaPower, forKey: "POWER")
        }else if random == 3 {
            getArray[random] = true
            image.image = UIImage(named:imageArray[random]+".png")
            attack.text = String(charadata.charaPower[random])
            power = attack.text
            charaArray.append(power)
            userDefaults.set(charaPower, forKey: "POWER")
        }else if random == 4 {
            getArray[random] = true
            image.image = UIImage(named:imageArray[random]+".png")
            attack.text = String(charadata.charaPower[random])
            power = attack.text
            charaArray.append(power)
            userDefaults.set(charaPower, forKey: "POWER")
        }else if random == 5 {
            getArray[random] = true
            image.image = UIImage(named:imageArray[random]+".png")
            attack.text = String(charadata.charaPower[random])
            
        }else if random == 6 {
            getArray[random] = true
            image.image = UIImage(named:imageArray[random]+".png")
            attack.text = String(charadata.charaPower[random])
            power = attack.text
            charaArray.append(power)
            userDefaults.set(charaPower, forKey: "POWER")
        }
        
        print(getArray)
        
        userDefaults.set(random, forKey: "RANDOM")
        userDefaults.set(getArray, forKey: "GET")
        // Do any additional setup after loading the view.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
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
