import UIKit

var greeting = "Hello, playground"

func addVAT(_ source:Double) -> Double {
    return source * 1.1
}

func couponDiscount(_ source:Double) -> Double {
    return source * 0.9
}

func finalPrice(_ source:Double, additional: (Double)->Double)->Double {
    let price = additional(source)
    return price
}

let transaction1 = finalPrice(38.5, additional: addVAT)

// --- 커링
func makeAdder(x:Int) -> (Int)->Int {
    func adder(a:Int) -> Int {
        return x + a
    }
    return adder
}

let ex1 = makeAdder(x: 5)
let ex2 = makeAdder(x: 10)

print(ex1(2))
print(ex2(2))
print(makeAdder(x: 5)(2))

// ---
let sumClosure = { () -> Int in return 1 }

// 캡쳐링
var adder = 5
let myadder = { [adder] in print(adder + 5) } // 값 캡쳐 : 나중에 실행될 값을 미리 받는 개념, 별도의 큐에서 실행됨, 만약 값이 원시타입이 아니고 참조 타입이면? 메모리에서 안내려감
adder = 7 // 캡쳐 이후 값이 바껴도 안 먹힘
myadder()
