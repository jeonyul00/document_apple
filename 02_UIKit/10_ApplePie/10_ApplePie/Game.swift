//
//  Game.swift
//  10_ApplePie
//
//  Created by 전율 on 2023/11/28.
//

import Foundation

struct Game {
    var word:String
    var incorrectMoveRemaining:Int
    var guessedLetters: [Character]
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMoveRemaining -= 1
        }
    }
}
