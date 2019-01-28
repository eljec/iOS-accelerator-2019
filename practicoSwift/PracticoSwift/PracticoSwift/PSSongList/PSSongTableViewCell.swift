//
//  PSSongTableViewCell.swift
//  PracticoSwift
//
//  Created by VICTOR ABEL CABEZA on 28/01/2019.
//  Copyright © 2019 Mercadolibre. All rights reserved.
//

import UIKit

class PSSongTableViewCell: UITableViewCell {

    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    
    var song: PSSong? {
        didSet {
            if let songItem = song {
                self.trackNameLabel.text = songItem.trackName
                self.collectionNameLabel.text = songItem.collectionName
                
                if let imageUrl = songItem.artworkUrl60 {
                    //DispatchQueue.main.async {
                        let url = URL(string: imageUrl)
                        let data = try? Data(contentsOf: url!)
                        self.artworkImageView.image = UIImage(data: data!)
                    //}
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
