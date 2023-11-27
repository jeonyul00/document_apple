import UIKit

/*
    공식문서에서는 class 보다는 struct를 권함
    struct : 값타입
    class : 참조타입
    가장 큰 차이 : class는 상속
 */

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "traveling at \(currentSpeed)"
    }
    
    func makeNoise() -> Void{
        print("1111")
    }
}

let someVehicle = Vehicle()
someVehicle.currentSpeed = 100
print(someVehicle.description)

class Bicycle: Vehicle {
    var hasBasket = false
}

class Tandem:Bicycle {
    var currentNumberOfPassengers = 0
    
    override func makeNoise (){
        print("2222")
    }
}


var tandem = Tandem()
tandem.currentSpeed
tandem.makeNoise()

// ---
// 상속 후에 자식 클래스 초기화 할 때 순서 중요
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Student:Person {
    var number: Int
    
    init( name: String, number: Int) {
        // 이 때 super가 밑에 있어야 함
        // Student가 스택에 먼저 들어가겠지
        // super.init(name: name)
        self.number = number
        super.init(name: name)
    }
}
