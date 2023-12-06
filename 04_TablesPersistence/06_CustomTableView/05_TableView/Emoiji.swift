//
//  Emoiji.swift
//  05_TableView
//
//  Created by 전율 on 2023/12/06.
//

import Foundation

struct Emoiji {
    var symbol:String
    var name:String
    var description:String
    var usage:String
    
    init(symbol: String, name: String, description: String,usage:String) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
