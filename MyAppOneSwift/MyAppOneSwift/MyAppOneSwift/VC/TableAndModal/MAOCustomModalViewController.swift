//
//  MAOCustomModalViewController.swift
//  MyAppOneSwift
//
//  Created by Marcio Mortarino on 27/01/2019.
//  Copyright © 2019 Marcio Mortarino. All rights reserved.
//

import UIKit

class MAOCustomModalViewController: UIViewController {
    
    var arrayItemsModal: dateFromJson? = nil
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var priceTrackLabel: UILabel!
    @IBOutlet weak var purchaseButtonLabel: UIButton!
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var modalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.60)
        self.modalView.layer.cornerRadius = 10
        self.purchaseButtonLabel.setTitle("Buy 'here'", for: UIControl.State.normal)
        
        trackNameLabel.text = arrayItemsModal!.trackName
        collectionNameLabel.text = arrayItemsModal!.collectionName
        artistNameLabel.text = arrayItemsModal!.artistName
        priceTrackLabel.text = arrayItemsModal!.trackPrice?.description
        let url = URL(string: arrayItemsModal!.artworkUrl100!)
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async {
                self.trackImage.image = UIImage(data: data!)
            }
        }
        downloadPicTask.resume()
    }

    @IBAction func closeModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func openUrlOnClick(_ sender: Any) {
        if let url = URL(string: arrayItemsModal!.trackViewUrl!) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view != self.modalView {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
