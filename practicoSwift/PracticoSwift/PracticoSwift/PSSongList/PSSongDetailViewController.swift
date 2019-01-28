//
//  PSSongDetailViewController.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 28/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import UIKit

class PSSongDetailViewController: UIViewController {

    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    var song: PSSong?
    
    fileprivate func initialize() {
        if let songItem = song {
            if let trackName = songItem.trackName{
                self.trackNameLabel.text = trackName
            }
            
            if let artistName = songItem.artistName{
                self.artistNameLabel.text = artistName
            }
            
            if let url = URL(string: songItem.artworkUrl100!){
                let data = try? Data(contentsOf: url)
                self.collectionImageView.image = UIImage(data: data!)
            }
            
            if let collectionName = songItem.collectionName{
                self.collectionNameLabel.text = collectionName
            }
            
            if let releaseDate = songItem.releaseDate{
                let formatter = DateFormatter()
                // initially set the format based on your datepicker date / server String
                formatter.dateFormat = "dd/MM/yyyy"
                let dateString = formatter.string(from: releaseDate)
                self.releaseDateLabel.text = dateString
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        navigationItem.title = "Song Detail"
    }
    @IBAction func buyTrack(_ sender: Any) {
        guard let url = URL(string: (song?.trackViewUrl)!) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
}
