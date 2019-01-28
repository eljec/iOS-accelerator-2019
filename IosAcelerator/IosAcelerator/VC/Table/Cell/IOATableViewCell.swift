//
//  IOATableViewCell.swift
//  IosAcelerator
//
//  Created by Pedro Eduardo Waquim on 28/01/2019.
//  Copyright © 2019 Pedro Eduardo Waquim. All rights reserved.
//

import UIKit

class IOATableViewCell: UITableViewCell {
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func cargar(track: Track){
        trackName.text = track.trackName
        albumName.text = track.collectionName
        
        if let thumbnail = track.artworkUrl100 {
            weak var weakSelf = self
            let service = IOAService()
            service.fetchImageFromUrl(urlString: thumbnail, closure: { image in
                weakSelf?.trackImage.image = image
            })
        }
    }
}
