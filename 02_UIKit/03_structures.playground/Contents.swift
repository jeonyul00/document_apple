import UIKit

var greeting = "Hello, playground"

/*
    인스턴스 메소드 안에서 프로퍼티 값을 재할당하고 싶을 때 -> mutationg
    인스턴스가 초기화 될 때 모든 프로퍼티는 어떤 방식으로든 초기화가 되어야함
 */
struct Odometer {
    var count:Int
    
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

var odometer = Odometer(count: 1)
odometer.count
