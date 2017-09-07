//
//  QueryItemProvider.swift
//  iTunesSearchClient
//
//  Created by David Anglin on 9/6/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
