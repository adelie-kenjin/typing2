//
//  CharaterViewController.swift
//  typing
//
//  Created by Kenji Isobe on 2017/06/28.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController ,UIScrollViewDelegate {

    var scrollView:UIScrollView!
    var pageControll:UIPageControl!
    var image:UIImage!
    
    var userDefaults:UserDefaults = UserDefaults.standard

    var getArray:[Bool] = [false,false,false,false,false,false,false]
    var charaData:CharaData = CharaData()
    var charaArray:[String] = []
    var charaPower:[Int] = [Int]()
    var b: Int = 0
    
    @IBOutlet var choiceButton:UIButton!
    @IBOutlet var backButton:UIButton!
    @IBOutlet var point:UILabel!
    @IBOutlet var name:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /* if userDefaults.array(forKey: "CHARA") != nil {
            
        print(userDefaults.array(forKey: "CHARA"))
            
            charaArray = userDefaults.array(forKey: "CHARA") as! [String]
        }
        if userDefaults.array(forKey: "POWER") != nil {
            charaPower = userDefaults.array(forKey: "POWER") as! [Int]
        }*/
        if userDefaults.array(forKey: "GET") != nil {
            getArray = userDefaults.array(forKey: "GET") as! [Bool]
        }
        
   /*     if userDefaults.object(forKey: "NUM") != nil {
            b = userDefaults.object(forKey: "NUM") as! Int
        }
        */
        print(getArray)
        
        
        getChara()
        
       
        self.scrollView = UIScrollView(frame: self.view.bounds)
        self.scrollView.contentSize = CGSize(width: self.view.bounds.width * CGFloat(charaArray.count), height: self.view.bounds.height*2/3)
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.delegate = self;
        self.view.addSubview(self.scrollView)
        self.pageControll = UIPageControl(frame: CGRect(x:0, y:self.view.bounds.height-50,width: self.view.bounds.width,height: 50))
        self.pageControll.numberOfPages = charaArray.count
        self.pageControll.currentPage = 0
        self.view.addSubview(pageControll)
        
        
        for p in 1..<charaArray.count+1 {
            var v = UIImageView(frame: CGRect(x:self.view.bounds.width * CGFloat(p-1),y: 50, width:self.view.bounds.width, height:self.view.bounds.height*2/3))
            v.image = UIImage(named: charaArray[p-1]+".png")
            v.contentMode = .scaleAspectFit
            self.scrollView.addSubview(v)
            image = v.image
            name.text = charaArray[p-1]
            point.text = String(charaPower[p-1])
        }
        name.text = charaArray[0]
        
        image = UIImage(named: charaArray[0]+".png")
        
        point.text = String(charaPower[0])
        
        pageControll.currentPage = 0
        
        self.view.bringSubview(toFront: choiceButton)
        
        self.view.bringSubview(toFront: backButton)
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if userDefaults.object(forKey: "GET") != nil {
            getArray = userDefaults.object(forKey: "GET") as! [Bool]
        }
        getChara()
        
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var pageProgress = Double(scrollView.contentOffset.x / scrollView.bounds.width)
        print(pageProgress)
        b = Int(pageProgress)
        pageControll.currentPage = Int(pageProgress)

        name.text = charaArray[Int(pageProgress)]
        point.text = String(charaPower[Int(pageProgress)])
        
        print(charaArray[b])
        
       // userDefaults.set(b, forKey: "NUM")
        
     //  let page = Int(round(pageProgress))
     //  self.pageControll.currentPage = page
       // self.pageControll.currentPage = Int(round(pageProgress))
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func a(){
        print(image)
        let data = UIImagePNGRepresentation(UIImage(named: charaArray[b]+".png")!)
        userDefaults.set(data, forKey: "IMAGE")
        userDefaults.set(charaArray[b], forKey: "NAME")
        userDefaults.set(b, forKey: "NUM")
        print(charaArray[b])
        print("キャラクター変更しました")
    }
 
    func getChara() {
        charaArray.removeAll()
        charaPower.removeAll()
        for i in 0..<getArray.count {
            if getArray[i] == true {
                charaArray.append(charaData.chara[i])
                charaPower.append(charaData.charaPower[i])
            }
        }
        print(charaArray)
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
