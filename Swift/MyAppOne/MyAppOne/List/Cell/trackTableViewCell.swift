//
//  trackTableViewCell.swift
//  MyAppOne
//
//  Created by Mayco Martin Barale on 28/01/2019.
//  Copyright © 2019 Mayco Martin Barale. All rights reserved.
//

import UIKit

class trackTableViewCell: UITableViewCell {

    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var albumImageUIImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
