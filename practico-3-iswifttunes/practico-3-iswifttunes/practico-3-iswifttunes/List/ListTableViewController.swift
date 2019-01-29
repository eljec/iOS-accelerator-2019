//
//  ListTableViewController.swift
//  practico-3-iswifttunes
//
//  Created by Gonzalo Alexis Quarin on 27/01/2019.
//  Copyright © 2019 Gonzalo Alexis Quarin. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var tracks = [Track]()
    
    let _detailCustomCellIdentifier = "DetailCustomCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: _detailCustomCellIdentifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: _detailCustomCellIdentifier, for: indexPath) as! DetailTableViewCell
        
        let track = tracks[indexPath.row]
        cell.trackName = track.trackName
        cell.artistName = track.artistName
        cell.price = String(format: "%.2f", track.trackPrice!)
        cell.collectionName = track.collectionName
        
        if let url = URL(string: track.artworkUrl100!) {
            MLServicesHelper.downloadImage(from: url, callback: {(data) in
                cell.collectionImage = UIImage(data: data)
            })
        }
        
        cell.layoutSubviews()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController(_track: tracks[indexPath.row])
        self.present(detailViewController, animated: true, completion: nil)
    }
    
}
