//
//  Endpoint.swift
//  iTunesSearchClient
//
//  Created by David Anglin on 9/6/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension Endpoint {
    var urlComponets: URLComponents {
        var componets = URLComponents(string: base)!
        componets.path = path
        componets.queryItems = queryItems
        
        return componets
    }
    
    var request: URLRequest {
        let url = urlComponets.url!
        return URLRequest(url: url)
    }
}

enum Itunes {
    case search(term: String, media: ItunesMedia?)
}

extension Itunes: Endpoint {
    var base: String {
        return "https://itunes.apple.com"
    }
    
    var path: String {
        switch self {
        case . search: return "/search"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .search(let term, let media):
            var result = [URLQueryItem]()
            
            let searchTermItem = URLQueryItem(name: "term", value: term)
            result.append(searchTermItem)
            
            if let media = media {
                let mediaItem = URLQueryItem(name: "media", value: media.description)
                result.append(mediaItem)
            }
            
            return result
        }
    }
}
