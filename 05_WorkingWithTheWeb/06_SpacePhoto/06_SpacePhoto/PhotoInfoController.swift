//
//  PhotoInfo.swift
//  06_SpacePhoto
//
//  Created by 전율 on 2023/12/13.
//

import Foundation

struct PhotoInfoController {
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
        }
        task.resume()
    }
    
    
}
 
