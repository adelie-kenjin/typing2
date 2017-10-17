//
//  Audio.swift
//  typing
//
//  Created by Kenji Isobe on 2017/07/24.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit
import AVFoundation

class Audio: NSObject, AVAudioPlayerDelegate  {
    
    static let shared = Audio()

    var BGM_audioPlayer: AVAudioPlayer!
    var SE_audioPlayer: AVAudioPlayer!
    var userDefaults:UserDefaults = UserDefaults.standard
    
    private override init() {
        super.init()
        BGM_audioPlayer = AVAudioPlayer()
        SE_audioPlayer = AVAudioPlayer()
        let soundFilePath = Bundle.main.path(forResource: "", ofType: "mp3")!
        let fileURL: NSURL = NSURL(fileURLWithPath: soundFilePath)
        SE_audioPlayer = try! AVAudioPlayer(contentsOf: fileURL as URL, fileTypeHint: nil)
        
        SE_audioPlayer.prepareToPlay()
        if SE_audioPlayer.isPlaying == true {
            SE_audioPlayer.currentTime = 0
        }

    }
    
    //MARK: Animations
    class func damageAnimation(imageView: UIImageView) {
        
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.02
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: imageView.center.x - 5, y:imageView.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x:imageView.center.x + 5,y: imageView.center.y))
        imageView.layer.add(animation, forKey: "position")
        
    }
    
    class func vanishAnimation(imageView: UIImageView) {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            imageView.alpha = 0.0
        }, completion: nil)
    }
    
    //MARK: Sound Effects
    func playSE(fileName: String) {
        //AVAudioPlayer
        let soundFilePath = Bundle.main.path(forResource: fileName, ofType: "mp3")!
        let fileURL: NSURL = NSURL(fileURLWithPath: soundFilePath)
        /*
         //TODO: fix unwrapping error
         var error: NSError? = nil
         NSLog("%@", error!)
         */
        SE_audioPlayer = try! AVAudioPlayer(contentsOf: fileURL as URL, fileTypeHint: nil)
        
        SE_audioPlayer.prepareToPlay()
        if SE_audioPlayer.isPlaying == true {
            SE_audioPlayer.currentTime = 0
        }
        if userDefaults.object(forKey: "SEVOLUME") != nil {
            SE_audioPlayer?.volume = userDefaults.object(forKey: "SEVOLUME") as! Float
        }else {
            SE_audioPlayer?.volume = 0.5
        }
        SE_audioPlayer.play()
    }
    
    func playBGM(fileName: String) {
        
        let soundFilePath = Bundle.main.path(forResource: fileName, ofType: "mp3")!
        let fileURL: NSURL = NSURL(fileURLWithPath: soundFilePath)
        /*
         //TODO: fix unwrapping error
         var error: NSError? = nil
         NSLog("%@", error!)
         */
        BGM_audioPlayer = try! AVAudioPlayer(contentsOf: fileURL as URL, fileTypeHint: nil)
        BGM_audioPlayer?.numberOfLoops = -1
        BGM_audioPlayer?.delegate = self
        BGM_audioPlayer?.prepareToPlay()
        if BGM_audioPlayer?.isPlaying == true {
            BGM_audioPlayer?.currentTime = 0
        }
        if userDefaults.object(forKey: "VOLUME") != nil {
            BGM_audioPlayer?.volume = userDefaults.object(forKey: "VOLUME") as! Float
        }else {
            BGM_audioPlayer?.volume = 0.5
        }
        BGM_audioPlayer?.play()
    }
    
    func stopBGM() {
        BGM_audioPlayer.stop()
        /*if let player = Audio.BGM_audioPlayer {
            if player.isPlaying {
         
            }
        }*/
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            
        }
    }

    
}
