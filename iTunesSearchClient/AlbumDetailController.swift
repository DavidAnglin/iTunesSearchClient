//
//  AlbumDetailController.swift
//  iTunesSearchClient
//
//  Created by David Anglin on 9/5/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {
    
    let pendingOperations = PendingOperations()
    
    
    var album: Album? {
        didSet {
            if let album = album {
                configure(with: album)
                dataSource.update(with: album.songs)
                tableView.reloadData()
            }
        }
    }
    
    var dataSource = AlbumDetailDataSource(songs: [])

    @IBOutlet weak var artworkView: UIImageView!
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumGenreLabel: UILabel!
    @IBOutlet weak var albumReleaseDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let album = album {
            configure(with: album)
        }
        
        tableView.dataSource = dataSource
    }
    
    func configure(with album: Album) {
        
        let viewModel = AlbumDetailViewModel(album: album)
        
        // Add implemetation for artworkView
        
        albumTitleLabel.text = viewModel.title
        albumGenreLabel.text = viewModel.genre
        albumReleaseDateLabel.text = viewModel.releaseDate
        
        if album.artworkState == .placeholder {
            downloadArtworkForAlbum(album, inView: artworkView)
        }
    }
    
    func downloadArtworkForAlbum(_ album: Album, inView view: UIImageView) {
        if let _ = pendingOperations.downloadsInProgressView[view] {
            return
        }
        
        let downloader = ArtworkDownloader(album: album)
        
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgressView.removeValue(forKey: view)
                self.artworkView.image = album.artwork
            }
        }
        
        pendingOperations.downloadsInProgressView[view] = downloader
        pendingOperations.downloadQueue.addOperation(downloader)
    }
}
