//
//  MAOCustomTableViewCell.swift
//  MyAppOneSwift
//
//  Created by Marcio Mortarino on 27/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

import UIKit

class MAOCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var topLabelCell: UILabel!
    @IBOutlet weak var bottomLabelCell: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
