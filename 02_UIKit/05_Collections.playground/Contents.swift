import UIKit

// array : 순서, 같은 타입
var arr:[Int] = [1,2,3]
var arr2:Array<Int> = [1,2,3]
var arr3 = [Int]()

let firstNUmber = arr[1]
firstNUmber

// dictionary : 키:값, 순서x
var dic:[Int:String] = [1:"one", 2:"two"]
var dic2:Dictionary<Int,String> = [1:"one", 2:"two"]
var dic3 = [Int:String]()

dic[3] = "threeeeee"
dic.updateValue("three", forKey: 3) // if let 쓰면 아주 방어적이고 좋겠군
dic // 순서 보장x
// 키:값 배열로 뽑기
var key = Array(dic.keys)
print(key)
var value = Array(dic.values)
// 이건 안되나
var key2 = dic.keys
print(key2) // 이거도 되는데... 플레이그라운드라서 되는건가? 확인해보기

// ---
var total = [arr,arr2] // type : [[Int]] -> 왜?[[Int],[Int]]가 아니고? 아 저게 맞지
var total2:[[Int]] = [arr,arr2]
total
total2[0][0]
total2[1][0]
