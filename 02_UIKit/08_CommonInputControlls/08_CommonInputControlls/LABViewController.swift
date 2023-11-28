//
//  LABViewController.swift
//  08_CommonInputControlls
//
//  Created by 전율 on 2023/11/28.
//

import UIKit

class LABViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setTextButtonTapped(_ sender: Any) {
        if let inputValue = textField.text {
            textField.text = inputValue
            textLabel.text = inputValue
        }
        // 키보드의 응답을 받음
        textField.resignFirstResponder()
    }
    
    @IBAction func clearTextButtonTapped(_ sender: Any) {
        textLabel.text = ""
        // 키보드의 응답을 받음
        textField.resignFirstResponder()
    }
    
}
 
