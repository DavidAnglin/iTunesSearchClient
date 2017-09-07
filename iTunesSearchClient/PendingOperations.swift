//
//  PendingOperations.swift
//  iTunesSearchClient
//
//  Created by David Anglin on 9/6/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import Foundation
import UIKit

class PendingOperations {
    var downloadsInProgress = [IndexPath : Operation]()
    var downloadsInProgressView = [UIImageView : Operation]()
    let downloadQueue = OperationQueue()
}
