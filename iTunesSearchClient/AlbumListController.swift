//
//  AlbumListController.swift
//  iTunesSearchClient
//
//  Created by David Anglin on 9/5/17.
//  Copyright © 2017 David Anglin. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {
    
    private struct Constants {
        static let AlbumCellHeight: CGFloat = 80
    }
    
    var artist: Artist!
    
    lazy var dataSource: AlbumListDataSource = {
        return AlbumListDataSource(albums: self.artist.albums)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = artist.name
        
        tableView.dataSource = dataSource
    
    }

    // MARK: - Table View Delegate -

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.AlbumCellHeight
    }
    
    // MARK: - Navigation -
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbum" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                let selectedAlbum = dataSource.album(at: selectedIndexPath)
                selectedAlbum.songs = Stub.songs
                
                let albumDetailController = segue.destination as! AlbumDetailController
                albumDetailController.album = selectedAlbum
                
            }
        }
    }
    
}