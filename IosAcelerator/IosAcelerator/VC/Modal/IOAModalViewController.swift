//
//  IOAModalViewController.swift
//  IosAcelerator
//
//  Created by Pedro Eduardo Waquim on 28/01/2019.
//  Copyright © 2019 Pedro Eduardo Waquim. All rights reserved.
//

import UIKit

class IOAModalViewController: UIViewController {
    
    @IBOutlet weak var modalImageView: UIImageView!
    @IBOutlet weak var modalPrice: UILabel!
    @IBOutlet weak var modalArtist: UILabel!
    @IBOutlet weak var modalAlbum: UILabel!
    @IBOutlet weak var modalTrack: UILabel!
    @IBOutlet weak var modalBuyButton: UIButton!
    @IBOutlet weak var modalContentView: UIView!
    
    private let track : Track
    init(track: Track){
        self.track = track
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.6);
        self.modalContentView.layer.cornerRadius = 10.0;
        self.modalBuyButton.backgroundColor = self.modalBuyButton.tintColor;
        self.modalBuyButton.tintColor = UIColor.white;
        self.modalBuyButton.layer.cornerRadius = 3.0;
        
        // Set Data Properties
        self.modalTrack.text = self.track.trackName;
        self.modalAlbum.text = self.track.collectionName;
        self.modalArtist.text = self.track.artistName;
        if let price = self.track.trackPrice{
            self.modalPrice.text = String(format: "$%.2f", price)
        } else {
            self.modalPrice.text = "---"
        }
        
        weak var weakSelf = self
        if let url = self.track.artworkUrl100 {
            IOAService().fetchImageFromUrl(urlString: url, closure: { image in
                weakSelf?.modalImageView.image = image
            })
        }
    }
    
    @IBAction func dismissModal(_ sender: UIView) {
        dismiss(animated: true, completion: {})
    }
    
    @IBAction func comprarTrack(_ sender: UIButton) {
        if let trackURLString = track.previewUrl {
            let trackURLNil = URL(string: trackURLString)
            if let trackURL = trackURLNil {
                UIApplication.shared.open(trackURL, options: [:], completionHandler: nil)
            }
        }
    }
}
