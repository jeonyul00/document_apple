//
//  ViewController.swift
//  05_RainbowTabs
//
//  Created by 전율 on 2023/11/30.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarItem.badgeValue = "1"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sleep(2)
        tabBarItem.badgeValue = nil
    }
}

 
