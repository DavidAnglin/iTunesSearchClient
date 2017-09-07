//
//  ItunesError.swift
//  iTunesSearchClient
//
//  Created by David Anglin on 9/6/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import Foundation

enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
