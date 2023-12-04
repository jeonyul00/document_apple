//
//  ResultViewController.swift
//  07_PersonalityQuiz
//
//  Created by 전율 on 2023/11/30.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var resultAnserLabel: UILabel!
    var reponse: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswer: [AnimalType:Int] = [:]
        let responseTypes = reponse.map { $0.type }
        
        for res in responseTypes {
            frequencyOfAnswer[res] = (frequencyOfAnswer[res] ?? 0 ) + 1
        }
        
        let frequentAnswerSoreted = frequencyOfAnswer.sorted { (pair1, pair2) -> Bool in return pair1.value < pair2.value }
        
        let mostCommonAnswer = frequentAnswerSoreted.first!.key
        
        resultAnserLabel.text = "you are a \(mostCommonAnswer.rawValue)"
    }
}
