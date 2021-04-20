//
//  AppDelegate.swift
//  CirrusMDSDK-Swift-Pods
//
//  Created by Taylor Case on 9/13/19.
//  Copyright © 2019 steam. All rights reserved.
//

import UIKit
import CirrusMDSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        
        let config = CirrusMDConfig()
        config.logLevel = .verbose
        config.primaryColor = UIColor.black
        config.title = "Your Custom Title"
        config.launchOptions = launchOptions
        CirrusMD.singleton.config = config
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
            DispatchQueue.main.async {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        CirrusMD.singleton.registerForRemoteNotifications(deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        NSLog("Remote notification support is unavailable due to error: \(error)")
    }
    
    //MARK: UNUserNotificationCenterDelegate
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if CirrusMD.singleton.shouldPresentNotification(notification) {
            completionHandler([.alert, .sound, .badge])
        } else {
            completionHandler([])
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        CirrusMD.singleton.didReceiveNotification(center: center, response: response, withCompletionHandler: completionHandler)
    }
    
}

