//
//  AlbumCell.swift
//  iTunesSearchClient
//
//  Created by David Anglin on 9/5/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    static let reuseIdentifier = "AlbumCell"

    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    func configure(with viewModel: AlbumCellViewModel) {
        
        albumTitleLabel.text = viewModel.title
        genreLabel.text = viewModel.genre
        releaseDateLabel.text = viewModel.releaseDate
    }
}
