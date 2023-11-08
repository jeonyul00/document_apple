//
//  ViewController.swift
//  04_GettingStarted
//
//  Created by 전율 on 2023/11/08.
//

import UIKit

class ViewController: UIViewController {
    
    // 아울렛
    // @IBOutlet : 이 변수가 인터페이스빌더(스토리보드)로 부터 온 것을 의미
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.setTitle("onPress", for: .normal)
    }
    
    // 액션
    // sender : 이 함수가 반드시 1개의 버튼에만 연결되는건 아니다. 그 경우 이 함수를 실행시킨 오브젝트가 sender로 넘어옴
    @IBAction func onPress(_ sender: Any) {
        print("the button was press")
    }
    

}
 
