//
//  BankAccount.swift
//  BankApi
//
//  Created by VICTOR ABEL CABEZA on 31/01/2019.
//  Copyright © 2019 VICTOR ABEL CABEZA. All rights reserved.
//

import Foundation

@objc public class BankAccount: NSObject{
    var userName:String
    var accountNumber:Int
    private var movements:[BankAccountMovement] = []
    
    @objc public init(userName:String, accountNumber:Int) {
        self.userName=userName
        self.accountNumber=accountNumber
    }
    
    @objc public func updateAccount(_ movement:BankAccountMovement){
        self.movements.append(movement)
    }
    
    @objc public func getUserName() -> String{
        return self.userName
    }
    
    @objc public func getAccountNumber() -> Int{
        return self.accountNumber
    }
    
    @objc public func balance() -> Double{
        var balance: Double = 0.0
        for movement in self.movements {
            balance += movement.amount
        }
        return balance
    }
    
    @objc public func movementList(asc:Bool) -> [BankAccountMovement] {
        if asc {
            return self.movements.sorted(by: { $0.date > $1.date })
        } else {
            return self.movements.sorted(by: { $0.date < $1.date })
        }
    }
}
