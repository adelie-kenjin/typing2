//
//  typeViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/02/14.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit
import AVFoundation

class typeViewController: UIViewController ,UITextFieldDelegate,AVAudioPlayerDelegate{
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var label:UILabel!
    @IBOutlet var label2:UILabel!
    @IBOutlet var image:UIImageView!
    @IBOutlet var hpBar:UIProgressView!
    
    var typeArray: [String] = ["にくまん","ちゅうかまん","しゃしん","あんまん","ぴざまん","ごまあんまん","かれーまん","ぶたまん","さむらい","えんぴつ","おにぎり","こくばんけし","むだんけっせき","ひるやすみ","ふらんすぱん","けいたい","ぱそこん","あさごはん","すぷーん","かぞく","おやつ","くもり","たべのこし","たんさんすい","うでどけい","ふでたて","うんどうかい","あいふぉん","ふとん","ぬいぐるみ","すいとう"]
      var img1:UIImage = UIImage(named:"リス.png")!
      var img2:UIImage = UIImage(named:"怪獣.png")!
      var img3:UIImage = UIImage(named:"犬鷲.png")!
      var img4:UIImage = UIImage(named:"山賊.png")!
      var img5:UIImage = UIImage(named:"野犬.png")!
    var imageArray: [UIImage] = []
    
    var index: Int = 0
    var point: Int = 0
    var str: Int = 0
    var number : Int = 0
    var random : Int!
    var count : Float = 30.0
    var timer : Timer = Timer()
    var enemyhp : Float = 100
    var util = Audio.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        util = Audio.shared

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
        self,
        selector:"stop",
        name: NSNotification.Name.UIApplicationDidEnterBackground,
        object: nil
        )
        let notificationCenter1 = NotificationCenter.default
        notificationCenter1.addObserver(
            self,
            selector:"restart",
            name: NSNotification.Name.UIApplicationDidFinishLaunching,
            object: nil
        )

        self.titleTextField.becomeFirstResponder()
        imageArray = [img1,img2,img3,img4,img5]
        let ret = Int(arc4random_uniform(5))
        image.image = imageArray[ret]

        hpBar.transform = CGAffineTransform(scaleX: 1.0,y: 4.0)
        titleTextField.delegate = self
        random = Int(arc4random_uniform(UInt32(typeArray.count)))
        typeLabel.text = typeArray[random]
        str = typeArray[random].characters.count
        start()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        util.playBGM(fileName: "Chippy_2")
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
        util.stopBGM()
    }
    
    func stop(){
       util.stopBGM()
    }
    func restart(){
        util.playBGM(fileName: "Chippy_2")
    }
    
    func start() {
        if !timer.isValid {
            //タイマーが作動していない場合作動させる　!は否定の意味
            timer = Timer.scheduledTimer(timeInterval: 0.1,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true
            )
        }
        timer.fire()
    }
    
    func up(){
        count = count - 0.1
        label2.text = String(format: "%.1f",count)
        if label2.text == "0.0"{
            //変なところで音がなるから
            util.playSE(fileName: "601")
        }
        if count <= 0 {
            timer.invalidate()
            self.performSegue(withIdentifier: "result", sender: nil)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder(
        return true
    }
    
    //文字を判定する文字の数
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let currentIndex = typeArray[random].index(typeArray[random].startIndex, offsetBy: str)
        let subStr = typeArray[random].substring(to:currentIndex)
        
        if text == subStr {
            textField.text = ""
            point += 1
            enemyhp -= 10
            util.playSE(fileName: "attack")
            print(enemyhp)
            typeArray.remove(at: random)
            label.text = String(point)
            if typeArray.count <= 0 {
                print(count)
                self.performSegue(withIdentifier: "result", sender: nil)
                return false
            }
            random = Int(arc4random_uniform(UInt32(typeArray.count)))
            typeLabel.text = typeArray[random]
            str = typeArray[random].characters.count
            
            hpBar.progress = enemyhp/100
            if enemyhp <= 0{
                util.playSE(fileName: "691")
                timer.invalidate()
                print("敵のHPがなくなりました")
                self.performSegue(withIdentifier: "result", sender: nil)
            }
            return false
        }
        return true
    }
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        print(point)
        if segue.identifier == "result" {
            var result = segue.destination as! resultViewController
            result.point = self.point
            result.count = self.count
        }
    }
}

