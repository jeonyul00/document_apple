import UIKit

var greeting = "Hello, playground"

/*
    인스턴스 메소드 안에서 프로퍼티 값을 재할당하고 싶을 때 -> mutationg
 */
struct Odometer {
    var count:Int = 0
    
    mutating func increment(){
        count += 1
    }
    
    mutating func increment(by amount:Int) {
        count += amount
    }
    
    mutating func reset(){
        count = 0
    }
}
