//
//  QuestionData.swift
//  07_PersonalityQuiz
//
//  Created by 전율 on 2023/11/30.
//

import Foundation

struct Question {
    var text:String
    var type:ResponseType
    var answers:[Answer]
}

enum ResponseType {
    case sigle, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}


enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition:String {
        switch self {
        case .dog:
            return "dddoooggg"
        case .cat:
            return "ccccaaaattt"
        case .rabbit:
            return "rrrraaabbbiiitt"
        case .turtle:
            return "거북왕"
        }
        
    }
}
