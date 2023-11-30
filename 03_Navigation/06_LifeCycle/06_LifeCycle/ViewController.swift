//
//  ViewController.swift
//  06_LifeCycle
//
//  Created by 전율 on 2023/11/30.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad: 뷰가 메모리에 올라간 직후에 호출 vc")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear: 뷰가 화면에 나타나기 직전에 호출 vc")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear: 뷰가 화면에 완전히 나타난 직후에 호출 vc")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear: 뷰가 화면에서 사라지기 직전에 호출 vc")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear: 뷰가 화면에서 완전히 사라진 후에 호출 vc")
    }

}

