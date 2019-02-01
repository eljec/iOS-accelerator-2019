//
//  BankAccount.swift
//  BankApi
//
//  Created by VICTOR ABEL CABEZA on 31/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

import Foundation

@objc class BankAccountService: NSObject{
    let userName:String
    let accountNumber:Int
    private var movements:[BankAccountMovement] = []
    
    init(userName:String, accountNumber:Int) {
        self.userName=userName
        self.accountNumber=accountNumber
    }
    
    func addNewMovement(movement:BankAccountMovement){
        self.movements.append(movement)
    }
    
    func balance() -> Double{
        var balance: Double = 0.0
        for movement in self.movements {
            balance += movement.amount
        }
        return balance
    }
    
    func movementList(asc:Bool) -> [BankAccountMovement] {
        if asc {
            return self.movements.sorted(by: { $0.date > $1.date })
        } else {
            return self.movements.sorted(by: { $0.date < $1.date })
        }
    }
}
