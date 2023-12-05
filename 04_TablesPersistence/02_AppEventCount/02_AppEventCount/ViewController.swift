//
//  ViewController.swift
//  02_AppEventCount
//
//  Created by 전율 on 2023/12/05.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willResugnActiveLabel: UILabel!
    @IBOutlet weak var didEnterBkLabel: UILabel!
    @IBOutlet weak var willEnterForgroundLabel: UILabel!
    @IBOutlet weak var willTerminateLabel: UILabel!
    
    var launchCount = 0
    var becomeActiveCount = 0
    var resignActiveCount = 0
    var didEnterBkCount = 0
    var willEnterFrgCount = 0
    var willTerminateCount = 0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }
    
    
    func updateView(){
        didFinishLaunchingLabel!.text = "App has launched \(launchCount) times"
        didBecomeActiveLabel!.text = "App has Active \(becomeActiveCount) times"
        willResugnActiveLabel!.text = "App has Resugn \(resignActiveCount) times"
        didEnterBkLabel!.text = "App has backgroud \(didEnterBkCount) times"
        willEnterForgroundLabel!.text = "App has Forground \(willEnterFrgCount) times"
        willTerminateLabel!.text = "App has Terminate \(willTerminateCount) times"
    }
    
    
}

