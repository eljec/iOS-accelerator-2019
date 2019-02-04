//
//  DetailViewController.swift
//  MyAppOne
//
//  Created by Mayco Martin Barale on 28/01/2019.
//  Copyright © 2019 Mayco Martin Barale. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let track: Track

    @IBOutlet weak var albumUIImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    @IBAction func buyButton(_ sender: UIButton) {
        if let currentUrl = self.track.previewUrl {
            goUrl(currentUrl)
        }
    }
    
    init(_ obj: Track) {
        self.track = obj
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        self.trackNameLabel.text = self.track.trackName
        self.collectionNameLabel.text = self.track.collectionName
        self.artistNameLabel.text = self.track.artistName
        
        // load image 
        DispatchQueue.global().async {
            if let url = self.track.artworkUrl100 {
                if let urlObject = URL(string: url) {
                    if let data = try? Data(contentsOf: urlObject){
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.albumUIImageView.image = image
                            }
                        }
                    }
                }
            }
        }
    }
    
    // func to open the preview URL
    func goUrl(_ url: String) -> Void {
        if let urlToOpen = URL(string: url) {
            UIApplication.shared.open(urlToOpen, options: [:])
        }
    }

}
