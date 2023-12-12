import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


var base_url = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
let key = "iSccCx1YZRqSXgUe0bqGCBiHiOyVCAZyiFfebTIl"
let queryItems = [URLQueryItem(name: "api_key", value: key),
                  URLQueryItem(name: "date", value: "2011-07-13")]

base_url.queryItems = queryItems

let url = base_url.url!

let task = URLSession.shared.dataTask(with: url) { data, reponse, error in
    if let data = data {
//        print(data as NSData)
        let string = String(data: data, encoding: .utf8) ?? ""
        print(string)
    }
    PlaygroundPage.current.finishExecution()
}

task.resume()
