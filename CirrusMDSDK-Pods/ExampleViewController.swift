//
//  FirstViewController.swift
//  CirrusMDSDK-Swift-Pods
//
//  Created by Taylor Case on 9/13/19.
//  Copyright © 2019 steam. All rights reserved.
//

import UIKit
import CirrusMDSDK

class ExampleViewController: UINavigationController {
    
    let patientId = 886
    let sdkId = "21dca847-a7c8-4150-99eb-a255231a2f00"
    let secret = "eyJzaGFyZWRfc2VjcmV0IjoiZWFlZGZkYWMtZjBkYS00NGYxLTkxNDgtYTE3ZWQ4NDcxY2Q3IiwieDUwOV9jZXJ0X2RlciI6Ik1JSUQ4RENDQXRpZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREJjTVFzd0NRWURWUVFHRXdKVlV6RVdNQlFHQTFVRUNnd05RMmx5Y25WelRVUWdTVzVqTGpFVU1CSUdBMVVFQ3d3TFJXNW5hVzVsWlhKcGJtY3hEREFLQmdOVkJBTU1BMU5FU3pFUk1BOEdBMVVFQ0F3SVEyOXNiM0poWkc4d0lCY05OekF3TVRBeE1EQXdNREF3V2hnUE5EQXdNVEF4TURFd01EQXdNREJhTUZ3eEN6QUpCZ05WQkFZVEFsVlRNUll3RkFZRFZRUUtEQTFEYVhKeWRYTk5SQ0JKYm1NdU1SUXdFZ1lEVlFRTERBdEZibWRwYm1WbGNtbHVaekVNTUFvR0ExVUVBd3dEVTBSTE1SRXdEd1lEVlFRSURBaERiMnh2Y21Ga2J6Q0NBU0l3RFFZSktvWklodmNOQVFFQkJRQURnZ0VQQURDQ0FRb0NnZ0VCQUt2NFNDT284UURvV3dnWDJHM3NHNTZXcTlBQ3VQMVlMbkQwNjVNdE5oZXZ5SGFiMWhTQTRlOStSR1R6ZUU1cDBFdUh0a3NYK3ZCek9iUFdUOVQwN0dBaVBSVkdWaVFSellpWEFOQTIvMVBBdk9Pa1JCVGUrZlJFc2FkVHJEdWx1SHhhc3B6dk9NR21KU0xIckJBUTVVTUdjck9leU9PYktnb2JzK0dUNFg4V3ZsMG1wWEN4aEZtTVozdmx3aDZJaTEwRlFqN2J0NmI2b2YremRxSXRaK1hkTWtZalB2NFc2dGp4Ym0zS005djJxaTYrcVJraWxlZW5NbTRQb2FEL09YUmZCdUZMMFJrYi9uTDgxV0M4MkFyREUzNE0ycmZrUXNMeGFvLzROdHBtVlExemtxSXNYU3g4VEZaMWpDUVJXcFIxTDAzK09BYkp3c3gwVEgwUE9Fc0NBd0VBQWFPQnVqQ0J0ekFQQmdOVkhSTUJBZjhFQlRBREFRSC9NQjBHQTFVZERnUVdCQlI3RHdOdE5tNzVvVnZiSlBtaXg0dHY4MXlmUkRDQmhBWURWUjBqQkgwd2U0QVVldzhEYlRadSthRmIyeVQ1b3NlTGIvTmNuMFNoWUtSZU1Gd3hDekFKQmdOVkJBWVRBbFZUTVJZd0ZBWURWUVFLREExRGFYSnlkWE5OUkNCSmJtTXVNUlF3RWdZRFZRUUxEQXRGYm1kcGJtVmxjbWx1WnpFTU1Bb0dBMVVFQXd3RFUwUkxNUkV3RHdZRFZRUUlEQWhEYjJ4dmNtRmtiNElCQURBTkJna3Foa2lHOXcwQkFRc0ZBQU9DQVFFQUN6V0ZFY1N5WUQxNWQ1Qm0vdEhWZTRzQU44RWNNVGFQaVRXWkdYN0dXNGZUTFphWE5XRCtrUnN6VDlOU0FCNDVGNHF6Q3pCNE1hbmdZSHI5VlR0c1kzeGZpVDl3ZDFpMDJtNUorTjZLeFVrZ3Awdzh3YW90bVFmLzR4WnRta21Qa1Z3Rlo1NkVXTFVKcDFLLzIvQ2hOMDRlRGNHL3pvWXI1TDVaRkRDQW5iM0s5TUdoOVM0QjdBY2lKV0k1V0lmZncreGJQN3c4ckc3Y2sveDliWXFZbXZmelBrdXh0elRSK1Z1bHV5aDJCMzI2QU5na1k0dDNRNWNDNk1JQm45VFdFTEt3L1p4a2E3SUhKdGZ0ekxxZlpMckJBd1VFcm1OK29IbmFBaGxZb1VjdG9yNmk5alFmQTNnSTVTTW9hcVpUWEwrK0I4aW9nVHJZOUgwNWFEYzZ0dz09IiwicHVibGljX2tleV9wZW0iOiItLS0tLUJFR0lOIFBVQkxJQyBLRVktLS0tLVxuTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUFxL2hJSTZqeEFPaGJDQmZZYmV3YlxubnBhcjBBSzQvVmd1Y1BUcmt5MDJGNi9JZHB2V0ZJRGg3MzVFWlBONFRtblFTNGUyU3hmNjhITTVzOVpQMVBUc1xuWUNJOUZVWldKQkhOaUpjQTBEYi9VOEM4NDZSRUZONzU5RVN4cDFPc082VzRmRnF5bk84NHdhWWxJc2VzRUJEbFxuUXdaeXM1N0k0NXNxQ2h1ejRaUGhmeGErWFNhbGNMR0VXWXhuZStYQ0hvaUxYUVZDUHR1M3B2cWgvN04yb2kxblxuNWQweVJpTSsvaGJxMlBGdWJjb3oyL2FxTHI2cEdTS1Y1NmN5YmcraG9QODVkRjhHNFV2UkdSditjdnpWWUx6WVxuQ3NNVGZnemF0K1JDd3ZGcWovZzIybVpWRFhPU29peGRMSHhNVm5XTUpCRmFsSFV2VGY0NEJzbkN6SFJNZlE4NFxuU3dJREFRQUJcbi0tLS0tRU5EIFBVQkxJQyBLRVktLS0tLVxuIn0="
    var serverToken: String?
    
    let errorView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0))
    let loggedOutView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CirrusMDSDKSession.singleton.logLevel = .verbose
        
        configureSessionDelegate()
        styleNavigationBar()
        loadTokenForPatient(patientId: patientId)
        
        let root = CirrusMDSDKSession.singleton.messageViewController()
        setViewControllers([root], animated: false)
        
        addRightBarButtonItem()
        addLeftBarButtonItem()
    }
    
    private func configureSessionDelegate() {
        let errorLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0))
        errorLabel.text = "Custom Error View"
        errorLabel.textColor = .white
        errorView.addSubview(errorLabel)
        errorView.backgroundColor = .red
        
        let loggedOutLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 300.0, height: 300.0))
        loggedOutLabel.text = "Custom Logged Out View"
        loggedOutLabel.textColor = .white
        loggedOutView.addSubview(loggedOutLabel)
        loggedOutView.backgroundColor = .blue
    }
    
    private func configureColors() {
        let config = CirrusMDSDKColorConfig()
        config.primary = "FF5733"
        
        CirrusMDSDKSession.singleton.setColorConfig(config)
    }
    
    private func configureText() {
        let config = CirrusMDSDKConfig()
        config.title = "Your Custom Title"
        
        CirrusMDSDKSession.singleton.setConfig(config)
    }
    
    private func styleNavigationBar() {
        navigationBar.barTintColor = UIColor(red: 0.01, green: 0.4, blue: 0.62, alpha: 1.0)
        navigationBar.titleTextAttributes = [kCTForegroundColorAttributeName: UIColor.white] as [NSAttributedString.Key : Any]
        navigationBar.tintColor = UIColor.white
    }
    
    private func addRightBarButtonItem() {
        let searchButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showMenu))
        navigationBar.topItem?.rightBarButtonItem = searchButton
    }

    private func addLeftBarButtonItem() {
        guard tabBarController == nil else { return }
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(close))
        navigationBar.topItem?.leftBarButtonItem = closeButton
    }
    
    @objc private func showMenu(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let resetHistory = UIAlertAction(title: "Reset Patient History", style: .default) { (action) in
            self.resetHistoryForPatient(patientId: self.patientId)
        }
        alertController.addAction(resetHistory)
        
        let close = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(close)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.modalPresentationStyle = .popover
            let popoverPresenter = alertController.popoverPresentationController
            popoverPresenter?.barButtonItem = sender
        } else {
            alertController.modalPresentationStyle = .none
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
    
    func loadTokenForPatient(patientId: Int) {
        CirrusMDSDKSession.singleton.setSecret(secret)
        
        guard let url = URL(string: "https://staging.cirrusmd.com/sdk/v1/sandbox/sessions") else { return }
        let postDict = ["patient_id": patientId, "sdk_id": sdkId] as [String : Any]
        guard let postData = try? JSONSerialization.data(withJSONObject: postDict, options: []) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = postData
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let postDataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            guard let responseObject = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
            guard let responseDict = responseObject as? [String: Any] else { return }
            guard let serverToken = responseDict["token"] as? String else { return }
            self.serverToken = serverToken
            self.setToken(token: serverToken)
        }
        postDataTask.resume()
    }
    
    func resetHistoryForPatient(patientId: Int) {
        CirrusMDSDKSession.singleton.setSecret(secret)
        
        guard let url = URL(string: "https://staging.cirrusmd.com/sdk/v1/sandbox/history") else { return }
        let postDict = ["patient_id": patientId, "sdk_id": sdkId] as [String : Any]
        guard let postData = try? JSONSerialization.data(withJSONObject: postDict, options: []) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = postData
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let postDataTask = session.dataTask(with: request) { (data, response, error) in
            guard let serverToken = self.serverToken else { return }
            self.serverToken = serverToken
        }
        postDataTask.resume()
    }
    
    func setToken(token: String) {
        /*
         Loads an SSO user from the provided token.`[CirrusMDSDKSession.singleton setSecret:]`
         must be called prior to calling `[CirrusMDSDKSession.singleton setToken:completion:]`
         */
        CirrusMDSDKSession.singleton.setToken(token) { (result) in
            switch result {
            case .success:
                NSLog("Set Token Success")
            case .invalidToken:
                NSLog("Set Token Invalid Token Error")
            case .noSecretProvided:
                NSLog("Set Token No Secret Provided")
            case .serviceUnavailable:
                NSLog("Set Token Service Unavailable")
            }
        }
    }

}

// MARK: - CirrusMDSKSessionDelegate

extension ExampleViewController: CirrusMDSKSessionDelegate {
    
    func viewForError(code: CirrusMDSDKSessionResult) -> UIView {
        return errorView
    }
    
    func viewForLoggedOut() -> UIView {
        return loggedOutView
    }
    
}
