//
//  AppDelegate.swift
//  TwitterReporteriOS
//
//  Created by Neal Soni on 4/23/20.
//  Copyright © 2020 Yale University. All rights reserved.
//

import UIKit
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        initializeOneSignal(launchOptions: launchOptions)
        return true
    }
    
    func initializeOneSignal(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false]

        // Replace 'YOUR_APP_ID' with your OneSignal App ID.
        OneSignal.initWithLaunchOptions(launchOptions,
        appId: "cc83f141-5f54-43c6-b88a-2bba1c2cb078",
        handleNotificationAction: nil,
        settings: onesignalInitSettings)

        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification;

        /*Use to prompt the device to subscribe
        //Recommended to see step 6 for prompting
        OneSignal.promptForPushNotifications(userResponse: { accepted in
        print("User accepted notifications: \(accepted)")
        })
        */
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

