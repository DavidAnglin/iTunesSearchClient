//
//  ViewController.swift
//  iTunesSearchClient
//
//  Created by David Anglin on 9/5/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let endpoint = Itunes.search(term: "taylor swift", media: .music)
        print(endpoint.request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

