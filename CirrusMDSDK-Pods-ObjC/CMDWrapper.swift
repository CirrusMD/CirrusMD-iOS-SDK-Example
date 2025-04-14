//
//  CMDWrapper.swift
//  CirrusMDSDK-Example
//
//  Created by Thomas Klucher on 4/14/25.
//  Copyright © 2025 steam. All rights reserved.
//
//
//  This is an example of how to integrate the 12.0.0 version of the CirrusMD SDK into an Objective-C project.

import Foundation
import CirrusMDSDK
import UIKit

public class CMDWrapper: NSObject {
    
    @objc func startSDK(withLuanchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        CirrusMD.singleton.startSDK(withLuanchOptions: withLuanchOptions)
    }
    
    @objc func configureSDK(withButtonItems: [UIBarButtonItem]) {
        let config = CirrusMDConfig()
        config.logLevel = .verbose
        config.primaryColor = UIColor.black
        config.primaryColorDarkMode = UIColor.purple
        config.title = "Your Custom Title"
        config.enableSettings = true
        config.rightBarButtonItems = withButtonItems
        CirrusMD.singleton.setSDKConfiguration(config)
    }
    
    @objc func currentViewController() -> UIViewController? {
        return CirrusMD.singleton.viewController
    }
    
    @MainActor
    @objc func startPatientSession(withToken: String, andSecret: String, withCompletionHandler completionHandler: @escaping (Bool) -> Void) {
        CirrusMD.singleton.configureWithToken(withToken, andSecret: andSecret) { (result) in
            switch result {
            case .success:
                print("Set Token Success")
                completionHandler(true)
            case .invalidToken:
                print("Set Token Invalid Token Error")
                completionHandler(false)
            case .noSecretProvided:
                print("Set Token No Secret Provided")
                completionHandler(false)
            case .serviceUnavailable:
                print("Set Token Service Unavailable")
                completionHandler(false)
            case .sdkAlreadyConfiguredMustCallLogout:
                print("Sdk already configured this is sent if a patient is already configured and you try another one")
                // You can just log out here and try again
                completionHandler(false)
            @unknown default:
                print("Set Token Invalid Token Error")
                completionHandler(false)
            }
        }
    }
    
}
