//
//  RGBankAccountLib.swift
//  RGBankAccountLib
//
//  Created by Roman Guarino on 01/02/2019.
//  Copyright © 2019 Román Guarino. All rights reserved.
//
import Foundation

@objc public class RGBankAccount : NSObject {
    
    @objc public func doMovementAccount(value: Float) -> RGAccount {
        let userDefaults = UserDefaults.standard
        var account: RGAccount = RGAccount(balance: 0.0, movement: [])
        if let decoded = userDefaults.object(forKey: "account") as? Data {
            account = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! RGAccount
        }
        account.balance = account.balance + value
        let movement = RGMovement(value: value, date: Date())
        account.movement.append(movement)
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: account)
        userDefaults.set(encodedData, forKey: "account")
        userDefaults.synchronize()
        
        return account
    }
    
    @objc public func clearAccount() -> Bool {
        let userDefaults = UserDefaults.standard
        let account: RGAccount = RGAccount(balance: 0.0, movement: [])
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: account)
        userDefaults.set(encodedData, forKey: "account")
        userDefaults.synchronize()
        return true
    }
    
    @objc public func getAccount() -> RGAccount {
        let userDefaults = UserDefaults.standard
        if let decoded = userDefaults.object(forKey: "account") as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: decoded) as! RGAccount
        } else {
            return RGAccount(balance: 0.0, movement: [])
        }
    }
    
    @objc public func getAccountBalance() -> Float {
        let userDefaults = UserDefaults.standard
        if let decoded = userDefaults.object(forKey: "account") as? Data {
            let account = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! RGAccount
            return account.balance
        } else {
            return 0.0
        }
    }
}
