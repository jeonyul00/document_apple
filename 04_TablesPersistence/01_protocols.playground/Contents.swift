import UIKit
import Foundation // Codable 쓰려면

class Shoe:CustomStringConvertible {
    var description: String { return "shoe color : \(color), size : \(size), hasLaces : \(hasLaces)" }
    let color: String
    let size: Int
    let hasLaces:Bool
    
    init(color: String, size: Int, hasLaces: Bool) {
        self.color = color
        self.size = size
        self.hasLaces = hasLaces
    }
}

let shoe1 = Shoe(color: "red", size: 240, hasLaces: true)
let shoe2 = Shoe(color: "blue", size: 260, hasLaces: false)

print(shoe1)
print(shoe2)

// ---
// (직접 만든 타입)두개의 값이 같은지를 확인 : Equatable protocol -> 메모리 주소로 확인하나? => ㄴㄴ 아님 프로퍼티 값을 다 확인함
// struct에서만 가능, class에서는 만들어서 써야함
// Comparable: 정렬 프로토콜? 비교 연산 프로토콜ㅇㅇ
// Cordable: key와 value 쌍으로 저장할 값을 넘겨줌 => 인코딩 디코딩 하는 프로토콜 아니었나..
struct Employee: Equatable, Comparable, Codable {
    
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.firstName < rhs.firstName
    }
    
    var firstName:String
    var lastName:String
    var jobTitle:String
    var phoneName:String
}

let currentEmployee = Employee(firstName: "jeon", lastName: "yul", jobTitle: "dev", phoneName: "01000000000")
let currentEmployee2 = Employee(firstName: "kim", lastName: "yul", jobTitle: "dev", phoneName: "01011111111")
let currentEmployee3 = Employee(firstName: "choi", lastName: "yul", jobTitle: "dev", phoneName: "01011111111")
let currentEmployee4 = Employee(firstName: "lee", lastName: "yul", jobTitle: "dev", phoneName: "01011111111")

let arr: [Employee] = [currentEmployee,currentEmployee2,currentEmployee3,currentEmployee4]
let sortedArr = arr.sorted(by:>)
sortedArr.map { Employee in
    print(Employee)
}

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(currentEmployee), let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}

if currentEmployee == currentEmployee2 {
    print("same")
} else {
    print("different")
}

// create protocol
protocol FullyNamed {
    // only read
    var fullName: String { get }
    
    func sayFullName()
}

// delegation : 특정 작업을 위임?

// ---
class Human:Comparable, Equatable,CustomStringConvertible,Encodable {
    var description: String {
        return "name = \(self.name)"
    }
    
    var name:String
    var age:Int
    
    init(name:String, age:Int){
        self.name = name
        self.age = age
    }
    
    static func < (lhs:Human, rhs:Human) -> Bool {
        return lhs.age < rhs.age
    }
    
    static func == (lhs:Human, rhs:Human)->Bool{
        return lhs.name == rhs.name && lhs.age == rhs.age
    }
    
}

let human1 = Human(name: "jeon", age: 29)
let human2 = Human(name: "kim", age: 28)

print(human1)

if human1 == human2 {
    print("same")
} else {
    print("not same")
}

let humanArr = [human1,human2]
let sortedHuman = humanArr.sorted(by: <)
print(sortedHuman)

let jsonEncoder2 = JSONEncoder()
if let jsonData = try? jsonEncoder2.encode(human1), let jsonString = String(data: jsonData, encoding: .utf8) {
    print(jsonString)
}

protocol Vegicle {
    var numberOfWheels:Int { get }
    func drive()
}

struct Car:Vegicle{
    
    var numberOfWheels: Int { return 4 }
    
    func drive() {
        print("vroom")
    }
}

var car = Car()
car.drive()
