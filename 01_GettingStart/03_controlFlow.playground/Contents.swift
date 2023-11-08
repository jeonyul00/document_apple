import UIKit

/* control flow : 논리의 흐름 : 조건과 상태에 따라 다른 동작을 할 수 있다.

 */

let a = "a"
a
// !a // 아 안되네, js랑 다르다. 여긴 문법이 엄격함
  
let b = "b"

switch b {
case "A","B","C","D":
    print("A || B || C || D ")
case "a"..."z": // 이거 먹히네
    print("a ~ z")
case "a","b","c","d":
    // break가 없는데 여기를 안오네?
    print("a || b || c || d ")
default:
    break
}

let isTrue = !true ? !true ? !true ? !true : !false : !false : !false
isTrue
