//
//  URL+Helpers.swift
//  06_SpacePhoto
//
//  Created by 전율 on 2023/12/13.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String:String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map {URLQueryItem(name: $0.0, value: $0.1)}
        return components?.url
    }
}
