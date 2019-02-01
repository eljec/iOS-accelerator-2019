//
//  MAODetailViewController.swift
//  MyAppOneSwift
//
//  Created by Roman Guarino on 28/01/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

import UIKit

class MAODetailViewController: UIViewController {

    @IBOutlet weak var lblTrackName: UILabel!
    @IBOutlet weak var lblAlbumName: UILabel!
    @IBOutlet weak var lblAutorName: UILabel!
    @IBOutlet weak var lblTrackPrice: UILabel!
    @IBOutlet weak var imgAlbum: UIImageView!
    @IBOutlet weak var contentView: UIView!
    private var model: MAOListViewControllerModel!
    
    init(model: MAOListViewControllerModel){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.layer.cornerRadius = 10
        self.view.backgroundColor = UIColor.init(white: 0.0, alpha: 0.8)
        
        lblTrackName.text = model.trackName
        lblAlbumName.text = model.collectionName
        lblAutorName.text = model.artistName
        lblTrackPrice.text = model.trackPrice?.description
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: URL.init(string: self!.model.artworkUrl100!)!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.imgAlbum.image = image
                    }
                }
            }
        }
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        self.dismiss(animated: true) {}
    }
    
    @IBAction func btnBuy(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: (model.previewUrl)!)!, options: [:]) { (Bool) in }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(touches.first?.view != self.contentView) {
            self.dismiss(animated: true) {}
        }
    }
}
