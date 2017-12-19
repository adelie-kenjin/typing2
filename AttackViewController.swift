//
//  AttackViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/06/21.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit

class AttackViewController: UIViewController {
    
    @IBOutlet var coinLabel:UILabel!
    @IBOutlet var levelLabel:UILabel!
    @IBOutlet var image:UIImageView!
    
    var userDefaults:UserDefaults = UserDefaults.standard
    
    var level:Int = 0
    var coin:Int = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinLabel.text = String(coin)
        
        if userDefaults.object(forKey: "LEVEL") != nil {
            level = userDefaults.object(forKey: "LEVEL") as! Int
            
            levelLabel.text = String(level)
        }else {
            levelLabel.text = "0"
        }
        
        if userDefaults.object(forKey: "COIN") != nil {
            coin = userDefaults.object(forKey: "COIN") as! Int
            
            coinLabel.text = String(coin)
        }else {
            coinLabel.text = "100"
        }
        if userDefaults.object(forKey: "IMAGE") != nil {
            image.image = UIImage(data: userDefaults.object(forKey: "IMAGE") as! Data)
        }else {
            image.image = UIImage(named:"naidesu.png")
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if userDefaults.object(forKey: "LEVEL") != nil {
            level = userDefaults.object(forKey: "LEVEL") as! Int
            
            levelLabel.text = String(level)
        }else {
            levelLabel.text = "0"
        }
        
        if userDefaults.object(forKey: "COIN") != nil {
            coin = userDefaults.object(forKey: "COIN") as! Int
            
            coinLabel.text = String(coin)
        }else {
            coinLabel.text = "100"
        }
        if userDefaults.object(forKey: "IMAGE") != nil {
            image.image = UIImage(data: userDefaults.object(forKey: "IMAGE") as! Data)
        }else {
            image.image = UIImage(named:"naidesu.png")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button(){
        
        if coin < 20{
            let alert = UIAlertController(title: "コインが足りません",
                                          message: "ダンジョンに行ってコインをためてください",
                                          preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title :"OK",style :UIAlertActionStyle.cancel))
            alert.addAction(UIAlertAction(title :"ダンジョン",
                                          style :.default,
                                          handler: {action in
                                            self.tabBarController?.selectedIndex = 0
            }))
            present(alert, animated: true,completion: nil)
        }
        
        if coin >= 20{
            level = level + 1
            coin = coin - 20
        }
        levelLabel.text = String(level)
        coinLabel.text = String(coin)
        
        userDefaults.set(level, forKey: "LEVEL")
        userDefaults.set(coin, forKey: "COIN")

    }
    
    func performSegueToButtle(){
        //performSegue(withIdentifier: "toCoinViewController",sender: nil)
        
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "coinView") as! CoinViewController
        self.present(nextView, animated: true, completion: nil)
        
    }
    @IBAction func chara(_ sender: Any) {
        performSegue(withIdentifier: "goCharaViewController", sender: nil)
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
