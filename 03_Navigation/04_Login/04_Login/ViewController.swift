//
//  ViewController.swift
//  04_Login
//
//  Created by 전율 on 2023/11/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var forgotUsernameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // performSegue: 정의된 세그웨이를 호출
    @IBAction func forgotUserName(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: forgotUsernameButton)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: forgotPasswordButton)
    }
    
    // prepare: 세그웨이가 실행되기 직전에 호출
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        if segue.identifier == "ForgottenUsernameOrPassword" {
            if sender == forgotUsernameButton {
                segue.destination.navigationItem.title = "ForgottenUsername"
            } else if sender == forgotPasswordButton {
                segue.destination.navigationItem.title = "ForgottenPassword"
            }
        } else {
            segue.destination.navigationItem.title = self.usernameField.text
        }
    }
    
}

