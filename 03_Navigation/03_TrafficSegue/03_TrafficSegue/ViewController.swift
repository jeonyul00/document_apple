//
//  ViewController.swift
//  03_TrafficSegue
//
//  Created by 전율 on 2023/11/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    @IBAction func unwindToRed(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        
    }

    // 세그웨이 시작점에서 정보를 뒤로 넘길 때
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = textField.text
    }
    
}

