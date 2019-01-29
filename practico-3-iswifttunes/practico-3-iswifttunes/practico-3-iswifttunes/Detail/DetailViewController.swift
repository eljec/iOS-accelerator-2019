//
//  DetailViewController.swift
//  practico-3-iswifttunes
//
//  Created by Gonzalo Alexis Quarin on 28/01/2019.
//  Copyright © 2019 Gonzalo Alexis Quarin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var collectionName: UILabel!
    @IBOutlet weak var collectionImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var primaryGenreName: UILabel!
    
    var track: Track?

    init(_track: Track){
        track = _track
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackName.text = track?.trackName
        collectionName.text = track?.collectionName
        artistName.text = track?.artistName
        primaryGenreName.text = track?.primaryGenreName
        
        if let url = URL(string: (track?.artworkUrl100!)!) {
            MLServicesHelper.downloadImage(from: url, callback: {(data) in
                self.collectionImage.image = UIImage(data: data)
            })
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        
        if touch?.view != container {
            dismiss(animated: true, completion: nil)
        }
    }
}
