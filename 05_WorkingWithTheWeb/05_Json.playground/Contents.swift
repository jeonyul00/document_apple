import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct PhotoInfo:Codable {
    var title:String
    var description:String
    var url:URL
    var copyright:String?
    
    enum CodingKeys:String, CodingKey {
        case title
        case description = "explanation"
        case url
        case copyright
    }
    
    init(from decoder:Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
    }
}

func fetchPhotoInfo(completion: @escaping (PhotoInfo?) ->Void) {
    var base_url = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
    let key = "iSccCx1YZRqSXgUe0bqGCBiHiOyVCAZyiFfebTIl"
    let queryItems = [URLQueryItem(name: "api_key", value: key), URLQueryItem(name: "date", value: "2011-07-13")]

    base_url.queryItems = queryItems

    let url = base_url.url!

    let task = URLSession.shared.dataTask(with: url) { data, reponse, error in
        let jsonDecoder = JSONDecoder()
        
        if let data = data, let PhotoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
            completion(PhotoInfo)
        }else {
            print("")
            completion(nil)
        }
        PlaygroundPage.current.finishExecution()
    }
    task.resume()
}

fetchPhotoInfo { PhotoInfo in
    if let PhotoInfo = PhotoInfo {
        print(PhotoInfo)
    }
}
