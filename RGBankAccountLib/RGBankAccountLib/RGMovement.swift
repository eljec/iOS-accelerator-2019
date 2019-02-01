//
//  RGMovement.swift
//  RGBankAccountLib
//
//  Created by Roman Guarino on 01/02/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

import UIKit

@objc public class RGMovement: NSObject, NSCoding {
    @objc public var value: Float
    @objc public var date: Date
    
    init(value: Float, date: Date) {
        self.value = value
        self.date = date
    }
    
    public required convenience init(coder aDecoder: NSCoder) {
        let value = aDecoder.decodeFloat(forKey: "value")
        let date = aDecoder.decodeObject(forKey: "date") as! Date
        self.init(value: value, date: date)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(value, forKey: "value")
        aCoder.encode(date, forKey: "date")
    }
}
