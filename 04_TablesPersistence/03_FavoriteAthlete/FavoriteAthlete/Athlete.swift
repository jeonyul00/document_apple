//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by 전율 on 2023/12/05.
//

import Foundation

struct Athlete {
    var name:String
    var age:String
    var league:String
    var team:String
    var description:String {
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
}
