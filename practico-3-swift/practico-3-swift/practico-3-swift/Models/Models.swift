//
//  Models.swift
//  practico-3-swift
//
//  Created by Gonzalo Alexis Quarin on 25/01/2019.
//  Copyright © 2019 Gonzalo Alexis Quarin. All rights reserved.
//

import Foundation

struct Track : Decodable {
    let wrapperType: String
    let trackName: String
    
    init(_trackName: String) {
        
        trackName = _trackName
        wrapperType = ""
    
    }
}

struct Result : Decodable {
    let resultCount : Int
    let results : [Track]
}
