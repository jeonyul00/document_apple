import UIKit
import PlaygroundSupport

var greeting = "Hello, playground"

let liveViewFrame = CGRect(x: 0, y: 0, width:500, height: 500)
let liveView = UIView(frame: liveViewFrame)
liveView.backgroundColor = .white
PlaygroundPage.current.liveView = liveView

// 애니메이션은 한 번에 다 실행된다
let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor = .purple
liveView.addSubview(square)

//UIView.animate(withDuration: 1.0, animations: {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 250, y: 250, width: 50, height: 50)
//}) { (_) in UIView.animate(withDuration: 1.0) {
//    square.backgroundColor = .purple
//    square.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//    }
//}



//UIView.animate(withDuration: 0.75, delay: 10.0 , options: [.repeat, .autoreverse, .curveEaseIn, .curveEaseInOut],animations: {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 225, y: 225, width: 50, height: 50)
//},completion: nil)

// concatenating : 연쇄, 약간 promiseAll 같네
UIView.animate(withDuration: 1.0, delay: 1.0,options: [.curveEaseIn, .curveEaseInOut], animations: {
    square.backgroundColor = .orange
    let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
    let rotateTransform = CGAffineTransform(rotationAngle: .pi / 4)
    let translateTransform = CGAffineTransform(translationX: 200, y: 200)
    // 병합 느낌이네
    let comboTransform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)
    square.transform = comboTransform
}) { Bool in
    if Bool {
        UIView.animate(withDuration: 1.0) {
            square.transform = CGAffineTransform.identity
        }
    }
}
