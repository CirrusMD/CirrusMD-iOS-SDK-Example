//
//  SecondViewController.swift
//  CirrusMDSDK-Swift-Pods
//
//  Created by Taylor Case on 9/13/19.
//  Copyright © 2019 steam. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func showSdk(_ sender: Any) {
        let example = ExampleViewController()
        present(example, animated: true, completion: nil)
    }
    
}

