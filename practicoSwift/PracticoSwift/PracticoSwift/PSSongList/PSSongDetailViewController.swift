//
//  PSSongDetailViewController.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 28/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import UIKit
import SafariServices
import PSSongApi

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
                self.trackNameLabel.text = "🎧: \(trackName)"
            }
            
            if let artistName = songItem.artistName{
                self.artistNameLabel.text = "👨🏻‍🎤: \(artistName)"
            }
            
            if let url = URL(string: songItem.artworkUrl100!){
                DispatchQueue.main.async {
                    let data = try? Data(contentsOf: url)
                    self.collectionImageView.image = UIImage(data: data!)
                }
            }
            
            if let collectionName = songItem.collectionName{
                self.collectionNameLabel.text = "💽: \(collectionName)"
            }
            
            self.releaseDateLabel.text = "📅: 01/02/2015"
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
