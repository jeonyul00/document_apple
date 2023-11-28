import UIKit

/*
    for
    while
*/

for index in 1...5 {
    print(index)
}

for index in 1..<6 {
    print(index)
}

let names:Array<String> = ["jeon", "kim", "lee"]
for name in names {
    print(name)
}

// 딕셔너리로 하면? => 튜플(key:value)로 뺴줌
let dic = ["jeon":"yul","kim":"yunji"]
for (first, second) in dic {
    print(first, second)
}
