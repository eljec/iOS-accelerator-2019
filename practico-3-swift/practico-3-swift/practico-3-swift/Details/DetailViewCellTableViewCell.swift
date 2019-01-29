//
//  DetailViewlCellTableViewCell.swift
//  practico-3-swift
//
//  Created by Gonzalo Alexis Quarin on 25/01/2019.
//  Copyright © 2019 Gonzalo Alexis Quarin. All rights reserved.
//

import UIKit

class DetailViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var trackName: UILabel?
    
//    var track: Track?  {
//        didSet{
//            if let _trackName = track?.trackName {
//                print("Nuevo valor asignado: \(_trackName)")
//            }
//
////            trackName?.text = track?.trackName
//        }
//    }
    
    func setupCell(_track: Track){
//        track = _track
        print("\(trackName)")
        trackName?.text = _track.trackName

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
