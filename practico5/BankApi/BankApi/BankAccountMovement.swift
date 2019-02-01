//
//  File.swift
//  BankApi
//
//  Created by VICTOR ABEL CABEZA on 31/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

import Foundation

@objc public class BankAccountMovement: NSObject {
    let amount:Double
    let date:Date
    @objc public init(amount:Double, date:Date) {
        self.amount = amount
        self.date = date
    }
    
    @objc public func getAmount() ->Double {
        return self.amount
    }
    
    @objc public func getDate() ->Date {
        return self.date
    }
}
