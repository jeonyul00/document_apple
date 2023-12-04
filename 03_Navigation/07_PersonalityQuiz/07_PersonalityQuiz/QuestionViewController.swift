//
//  QuestionViewController.swift
//  07_PersonalityQuiz
//
//  Created by 전율 on 2023/11/30.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questions:[Question] = [
        Question(text: "Which food do you like the most?", type: .sigle, answers: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrot", type: .rabbit),
            Answer(text: "Corn", type: .turtle)
        ]),
        
        Question(text: "Which activities do you enjoy?", type: .multiple, answers: [
            Answer(text: "Eating", type: .dog),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Swimming", type: .turtle)
        ]),
        
        Question(text: "How much do you enjoy car rides?", type: .ranged, answers: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "I barely notice them", type: .turtle),
            Answer(text: "I love them", type: .dog)
        ])
    ]
    
    var questionIndex = 0
    
    var answersChosen: [Answer] = []

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet weak var mutipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI()->Void {
        singleStackView.isHidden = true
        mutipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .sigle:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    @IBAction func sigleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answers
        switch sender {
        case singleButtons[0]:
            answersChosen.append(currentAnswer[0])
        case singleButtons[1]:
            answersChosen.append(currentAnswer[1])
        case singleButtons[2]:
            answersChosen.append(currentAnswer[2])
        case singleButtons[3]:
            answersChosen.append(currentAnswer[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBAction func multipleButtonAnswerPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        if multiSwitches[0].isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitches[1].isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitches[2].isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitches[3].isOn {
            answersChosen.append(currentAnswers[3])
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    func nextQuestion(){
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }
    
    func updateSingleStack(using answers:[Answer]){
        singleStackView.isHidden = false
        for i in 0...3 {
            singleButtons[i].setTitle(answers[i].text, for: .normal)
        }
    }
    
    func updateMultipleStack(using answers:[Answer]){
        singleStackView.isHidden = true
        mutipleStackView.isHidden = false
        for i in 0...3 {
            multiLabels[i].text = answers[i].text
        }
    }
    
    func updateRangedStack(using answers:[Answer]){
        mutipleStackView.isHidden = true
        rangedStackView.isHidden = false
        rangedLabels[0].text = answers.first?.text
        rangedLabels[1].text = answers.last?.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.reponse = answersChosen
        }
    }
    
    
}
