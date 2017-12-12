//
//  AppDelegate.swift
//  typing
//
//  Created by Kenji Isobe on 2017/02/14.
//  Copyright © 2017年 Kenji Isobe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var volume: Float = 0.5

    /*func grabStoryboard() -> UIStoryboard {
        var storyboard = UIStoryboard()
        let height = UIScreen.main.bounds.size.height
        let width = UIScreen.main.bounds.size.width
        
        print("縦の長さは", height)
        print("横の長さは", width)

        
        if height == 736 {
            storyboard = UIStoryboard(name: "Main_6plus", bundle: nil)
            print("6plusの画面が表示されます")
        } else if height == 480 {
            storyboard = UIStoryboard(name: "Main_4s", bundle: nil)
            print("4sの画面が表示されます")
        }else if width == 320{
            storyboard = UIStoryboard(name: "Main_5s", bundle: nil)
            print("5sの画面が表示されます")
        }else if height == 812 {
            storyboard = UIStoryboard(name: "Main_X", bundle: nil)
            print("Xの画面が表示されます")
        }else if width == 768{
            storyboard = UIStoryboard(name: "Main_iPadmini", bundle: nil)
            print("iPad Pro 9.7の画面が表示されます")
        }else{
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            print("通常の画面が表示されます")

        }
        return storyboard
    }*/
    /*func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyboard: UIStoryboard = self.grabStoryboard()
        if let window = window {
            window.rootViewController = storyboard.instantiateInitialViewController()
        }
        
        self.window?.makeKeyAndVisible()
        return true
    }*/

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

