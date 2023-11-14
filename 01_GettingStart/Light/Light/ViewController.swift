//
//  ViewController.swift
//  Light
//
//  Created by 전율 on 2023/11/14.
//

import UIKit

class ViewController: UIViewController {
    
    //    @IBOutlet weak var lightButton: UIButton!
    var lightOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    
    private func updateUI() -> Void {
//                if lightOn {
//                    view.backgroundColor = .white
        //            lightButton.setTitle("on", for: .normal)
//                    return
//                }
//                view.backgroundColor = .black
        //        lightButton.setTitle("off", for: .normal)
//            }
        
        view.backgroundColor = lightOn ? .white : .black
        
    }
    
}
