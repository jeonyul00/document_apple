import UIKit

/*
    중첩 옵셔널
 */

class Address {
    var buildingNumber:String?
    var streetName:String?
    var apartmentNumber:String?
}

class Residence {
    var address:Address?
}

class Person {
    var age:Int?
    var residence:Residence?
}

var person = Person()

// 옵셔널이 중첩 일 경우 => ?로 한 번에 접근
if let theApartmentNumber = person.residence?.address?.apartmentNumber {
    print(theApartmentNumber)
}

// ---
var userInput:String = "34e"

func checkAge(){
    let age:Int? = Int(userInput)
    if let age = age {
        let msg = age > 17 ? "welcome" : "sorry"
        print(msg)
    } else {
        print("get out")
    }
}

checkAge()
