//
//  HomepageViewController.swift
//  shortcuts
//
//  Created by Adil Özdemir on 30.08.2023.
//

import UIKit

class HomepageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // If user launch app from deeplink | Killed state
        if let deeplink = deeplinkToOpen {
            DeeplinkManager.shared.navigate(with: deeplink)
            deeplinkToOpen = nil
        }
    }
}
