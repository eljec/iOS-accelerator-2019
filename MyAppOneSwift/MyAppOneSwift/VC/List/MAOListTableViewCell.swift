//
//  MAOListTableViewCell.swift
//  MyAppOneSwift
//
//  Created by Roman Guarino on 25/01/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

import UIKit

class MAOListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTrackName: UILabel!
    @IBOutlet weak var imgAlbum: UIImageView!
    @IBOutlet weak var lblAlbumName: UILabel!
    
    convenience init(item: MAOListViewControllerModel) {
        self.init()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setModel(model: MAOListViewControllerModel) {
        self.clean()
        self.lblTrackName?.text = model.trackName!
        self.lblAlbumName?.text = model.collectionName!
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL.init(string: model.artworkUrl100!)!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                         self!.imgAlbum.image = image
                    }
                }
            }
        }
    }
    
    private func clean() {
        self.lblAlbumName.text = nil
        self.lblTrackName.text = nil
        self.imgAlbum.image = nil
    }
}
