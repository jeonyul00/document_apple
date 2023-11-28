//
//  ViewController.swift
//  08_CommonInputControlls
//
//  Created by 전율 on 2023/11/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // #selector:
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @IBAction func repondToTapGesture(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
        
    }
    
    @IBAction func keyboardReturnKeyTapped(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("the switch is on")
            return
        }
        print("the switch is off")
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        // sender에 넘어오는 것 : 이 함수(buttonTapped)를 실행시킨 오브젝트, 여기서는 button 오브젝트
    }
}

