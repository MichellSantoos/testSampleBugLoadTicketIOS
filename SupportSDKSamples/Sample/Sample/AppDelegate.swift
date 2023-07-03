//
//  AppDelegate.swift
//  CocoaPodSample
//
//  Created by Killian Smith on 22/05/2018.
//  Copyright © 2018 Killian Smith. All rights reserved.
//

import UIKit
import SupportSDK
import ZendeskCoreSDK

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        CoreLogger.enabled = true
        CoreLogger.logLevel = .debug
        
        // Initialize the SDK with your Zendesk instance
        // Get these details from your Zendesk dashboard: Admin -> Channels -> MobileSDK.
        #warning("Enter your zendesk app configs here")
        Zendesk.initialize(appId: "Set PP appId ",
                           clientId: "Set PP clientID ",
                           zendeskUrl: "https://picpay21589831114.zendesk.com")

        Support.initialize(withZendesk: Zendesk.instance)

        let identity = Identity.createJwt(token: "Set PP Token User")
        Zendesk.instance?.setIdentity(identity)
        
        let url =  Zendesk.instance?.storeModule.cacheDirectory
        if let path = url?.path  {
            print("####",url)
        }
        
        return true
    }
}
