//
//  DetailTableViewCell.swift
//  practico-3-iswifttunes
//
//  Created by Gonzalo Alexis Quarin on 27/01/2019.
//  Copyright © 2019 Gonzalo Alexis Quarin. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    var artistName: String?
    var price: String?
    var trackName: String?
    var collectionName: String?
    
    var collectionImage: UIImage? {
        didSet{
            if let imageView = collectionImage {
                collectionImageView.image = imageView
            }
        }
    }
    
    var collectionImageView: UIImageView = {
        let _collectionImageView = UIImageView()
        _collectionImageView.translatesAutoresizingMaskIntoConstraints = false
        _collectionImageView.layer.cornerRadius = 50
        _collectionImageView.layer.masksToBounds = true
        
        return _collectionImageView
    }()
    
    var trackNameLabel: UILabel = {
        let _trackNameLabel = UILabel()
        _trackNameLabel.translatesAutoresizingMaskIntoConstraints = false
       _trackNameLabel.font = UIFont(name: "Apple SD Gothic Neo", size: 20)
        
        return _trackNameLabel
    }()
    
    var collectionLabel: UILabel = {
        let _collectionLabel = UILabel()
        _collectionLabel.translatesAutoresizingMaskIntoConstraints = false
        _collectionLabel.font = UIFont(name: "HelveticaNeue", size: 13)
        _collectionLabel.textColor = UIColor.gray

        return _collectionLabel
    }()
    
    var artistNameLabel: UILabel = {
        let _artistNameLabel = UILabel()
        _artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        _artistNameLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
        _artistNameLabel.textColor = UIColor.red
        
        return _artistNameLabel
    }()
    
    var priceLabel: UILabel = {
        let _priceLabel = UILabel()
        _priceLabel.translatesAutoresizingMaskIntoConstraints = false
        _priceLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        
        return _priceLabel
    }()
    
    var signLabel: UILabel = {
        var _signLabel = UILabel()
        _signLabel.translatesAutoresizingMaskIntoConstraints = false
        _signLabel.font = UIFont(name: "HelveticaNeue", size: 15)
        _signLabel.text = "Price: "
        
        return _signLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(trackNameLabel)
        self.addSubview(collectionImageView)
        self.addSubview(collectionLabel)
        self.addSubview(artistNameLabel)
        self.addSubview(priceLabel)
        self.addSubview(signLabel)
        
        collectionImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        collectionImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        collectionImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        collectionImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        collectionImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        trackNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        trackNameLabel.leadingAnchor.constraint(equalTo: collectionImageView.trailingAnchor, constant: 10).isActive = true
        trackNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5).isActive = true
        
        collectionLabel.topAnchor.constraint(equalTo: self.trackNameLabel.bottomAnchor, constant: 5).isActive = true
        collectionLabel.leadingAnchor.constraint(equalTo: self.collectionImageView.trailingAnchor, constant: 10).isActive = true
        collectionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        
        
        artistNameLabel.topAnchor.constraint(equalTo: self.collectionLabel.bottomAnchor, constant: 5).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo: collectionImageView.trailingAnchor, constant: 10).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        
        priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        
        signLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: -5).isActive = true
        signLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -7).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let trackName = trackName {
            trackNameLabel.text = trackName
        }
        
        if let imageView = collectionImage {
            collectionImageView.image = imageView
        }
        
        if let artistName = artistName {
            artistNameLabel.text = artistName
        }
        
        if let price = price {
            priceLabel.text = String("$\(price)")
        }
        
        if let collectionName = collectionName {
            collectionLabel.text = collectionName
        }
    }

}
