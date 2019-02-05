//
//  RGAccount.swift
//  RGBankAccountLib
//
//  Created by Roman Guarino on 01/02/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//

import UIKit

@objc public class RGAccount: NSObject, NSCoding {
    @objc public var balance: Float = 0.0
    @objc public var movement: [RGMovement]
    
    init(balance: Float, movement: [RGMovement]) {
        self.balance = balance
        self.movement = movement
    }
    
    public required convenience init(coder aDecoder: NSCoder) {
        let balance = aDecoder.decodeFloat(forKey: "balance")
        let movement = aDecoder.decodeObject(forKey: "movement") as! [RGMovement]
        self.init(balance: balance, movement: movement)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(balance, forKey: "balance")
        aCoder.encode(movement, forKey: "movement")
    }
}
