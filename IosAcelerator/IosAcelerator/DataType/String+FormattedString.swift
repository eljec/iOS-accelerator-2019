//
//  NSString+FormattedString.swift
//  IosAcelerator
//
//  Created by Pedro Eduardo Waquim on 25/01/2019.
//  Copyright © 2019 Pedro Eduardo Waquim. All rights reserved.
//

import UIKit

extension String {
    
    static func formattedURLParams(params:String) -> String {
        let items = params.components(separatedBy: " ")
        var formattedUrl: String = ""
        for word in items {
            if !word.isEmpty{
                if !formattedUrl.isEmpty{
                    formattedUrl += "+"
                }
                formattedUrl += word
            }
        }
    
        return formattedUrl
    }
    
    static func formattedDate(dateString: String?) -> Date? {
        guard let dateString = dateString else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.timeZone = TimeZone(identifier: "GMT")
        
        let date = formatter.date(from: dateString)
        return date
    }
}
