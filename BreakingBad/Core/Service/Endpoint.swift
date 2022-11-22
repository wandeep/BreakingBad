//
//  Endpoint.swift
//  BreakingBad
//
//  Created by Wandeep Basra on 21/11/2022.
//

import Foundation

enum Endpoint {
    case characters
    case quotes(String)
    
    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "www.breakingbadapi.com"
        return urlComponents
    }
    
    var url: URL {
        switch self {
        case .characters:
            var urlComponents = urlComponents
            urlComponents.path = "/api/characters"
            return urlComponents.url!
        case .quotes(let author):
            var urlComponents = urlComponents
            urlComponents.path = "/api/quote"
            urlComponents.queryItems = [URLQueryItem(name: "author", value: author)]
            return urlComponents.url!
        }
    }
}
