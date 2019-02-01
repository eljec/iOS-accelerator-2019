//
//  File.swift
//  BankApi
//
//  Created by VICTOR ABEL CABEZA on 31/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

import Foundation

@objc class BankAccountMovement: NSObject {
    let amount:Double
    let date:Date
    init(amount:Double, date:Date) {
        self.amount = amount
        self.date = date
    }
}
