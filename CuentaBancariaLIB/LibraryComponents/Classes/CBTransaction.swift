//
//  Transaction.swift
//  Pods
//
//  Created by Pedro Eduardo Waquim on 01/02/2019.
//

import Foundation


@objc public class CBTransaction: NSObject, NSCoding {
    @objc public let amount: Double;
    
    @objc public init(amount: Double) {
        self.amount = amount
    }
    
    public required convenience init(coder aDecoder: NSCoder) {
        let amount = aDecoder.decodeDouble(forKey: "amount")
        self.init(amount: amount)
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(amount, forKey:"amount")
    }
}
