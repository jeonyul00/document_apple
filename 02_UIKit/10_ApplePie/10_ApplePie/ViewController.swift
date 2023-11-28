//
//  ViewController.swift
//  10_ApplePie
//
//  Created by 전율 on 2023/11/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    var listOfWords:Array<String> = ["buccaneer","swift","glorious","incandescent","bug","program"]
    let incorrectMoveAllowed:Int = 7
    
    var totalWins:Int = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses:Int = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame:Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound(){
        
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMoveRemaining: incorrectMoveAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func updateUI(){
        var letters = Array<String>()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMoveRemaining)")
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = (sender.titleLabel?.text)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func updateGameState(){
        if currentGame.incorrectMoveRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word  == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
        
    }
    
    func enableLetterButtons(_ enable:Bool) -> Void {
        for button in letterButtons {
            button.isEnabled = enable
        }
        
    }
    
}

